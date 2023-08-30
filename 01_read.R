#Lectura csv pokemon
df = read.csv(file="data/pokemon.csv")
df = tbl_df(df)
colnames(df)[25] <- "classification"

#Revisión tipo de datos
str(df)
head(df)
