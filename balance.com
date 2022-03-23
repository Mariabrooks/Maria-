func NewStateFromDisk() (*State, error) {
   // get current working directory
   cwd, err := os.Getwd()
   if err != nil {
      return nil, err
   }

   genFilePath := filepath.Join(cwd, "database", "genesis.json")
   gen, err := loadGenesis(genFilePath)
   if err != nil {
      return nil, err
   }
