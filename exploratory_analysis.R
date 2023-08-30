
# Análisis exploratorio ---------------------------------------------------

# Resumen estadístico de las variables numéricas
cat("Resumen estadístico de las variables numéricas:\n")
summary(df)

#¿Cuántos pokemones son lengendarios?
# Filtrar el dataframe para obtener solo los pokémon legendarios
pokemones_legendarios <- df[df$Legendary == "True", ]

#¿Cuantos pokemones tengo por cada generación?

# Número de pokémon por generación

# Cargar la librería plotly
library(plotly)

# Número de pokémon por generación
pokemones_por_generacion <- table(df$Generation)

# Crear gráfico interactivo de barras para mostrar el número de pokémon por generación
plot_ly(x = names(pokemones_por_generacion),
        y = pokemones_por_generacion,
        type = "bar",
        marker = list(color = "lightblue"),
        text = pokemones_por_generacion,
        hoverinfo = "text",
        name = "Generación") %>%
  layout(title = "Número de Pokémon por Generación",
         xaxis = list(title = "Generación"),
         yaxis = list(title = "Número de Pokémon"))

# Número de pokémon por tipo (Type.1)
pokemones_por_tipo <- table(df$Type.1)

# Crear gráfico interactivo de barras para mostrar el número de pokémon por tipo
plot_ly(x = names(pokemones_por_tipo),
        y = pokemones_por_tipo,
        type = "bar",
        marker = list(color = "lightgreen"),
        text = pokemones_por_tipo,
        hoverinfo = "text",
        name = "Tipo") %>%
  layout(title = "Número de Pokémon por Tipo",
         xaxis = list(title = "Tipo"),
         yaxis = list(title = "Número de Pokémon"))

#Tipos de pokemon según categoría
type_1_poke <- ggplot(data=df, aes(Type.1)) + geom_bar(aes(fill=..count..), alpha=0.8) + theme(axis.text.x = element_text(angle = 90, hjust = 0)) + ggtitle("Distribution Based on Type-1") + coord_flip()
type_2_poke <- ggplot(data=df, aes(Type.2)) + geom_bar(aes(fill=..count..), alpha=0.8) + theme(axis.text.x = element_text(angle = 90, hjust = 0)) + ggtitle("Distribution Based on Type-2") + coord_flip()
grid.arrange(type_1_poke, type_2_poke, ncol=2)

#Distribución valores - Análisis de densidad

density_hp <- ggplot(data=df, aes(HP)) + 
  geom_density(col="white",fill="pink", alpha=0.8) + 
  ggtitle("Density Plot of HP")

density_speed <- ggplot(data=df, aes(Speed)) + geom_density(col="white", fill="darkorchid", alpha=0.8) + ggtitle("Density Plot of Speed Characterstics")
density_attack <- ggplot(data=df, aes(Attack)) + geom_density(col="white", fill="orange", alpha=0.7) + ggtitle("Density Plot of Attack Characterstics")
density_defense <- ggplot(data=df, aes(Defense)) + geom_density(col="white", fill="firebrick", alpha=0.7) + ggtitle("Density Plot of Defense Characterstics")
grid.arrange(density_hp, density_speed, density_attack, density_defense, ncol=2)

#tipos de pokemon lengendario según su tipo (categoría 1)
# Filtrar los pokémon legendarios
legendarios <- df %>% filter(Legendary == "True")

# Contar los tipos de pokémon legendarios por categoría (Type.1)
conteo_legendarios <- count(legendarios, Type.1)

# Crear el gráfico interactivo de barras con orientación vertical del texto
plot_ly(data = conteo_legendarios, x = ~Type.1, y = ~n, type = "bar",
        marker = list(color = "blue", opacity = 0.8),
        text = ~paste("Type.1: ", Type.1, "<br>Number: ", n),
        hoverinfo = "text",
        name = "Count of Legendary Pokémon") %>%
  layout(title = "Number of Legendary Pokémon Based on Type-1",
         xaxis = list(title = "Type-1", tickangle = -90, tickfont = list(size = 10)),
         yaxis = list(title = "Count"))

