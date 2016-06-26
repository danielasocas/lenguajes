# Estudiantes
### 11-10979 - Daniela Socas
### 11-11020 - Sergio Teran
[comment]: # "Si el grupo es de un solo integrante, elimine la linea anterior"
---
# Respuestas

> Los lenguajes de programación orientados a objetos que poseen herencia simple están limitados a incorporar comportamientos de un solo ancestro al momento de definir una clase.

>> No, en lenguajes como ruby, una clase hijo() puede heredar de una clase padre(), tambien puede heredar siempre cosas de la clase Object(), siendo esta la madre de todas las clases.

> Lenguajes de POO con un sistemas de tipos estático (C++, Java, C\#) no tienen la posibilidades de elegir la implementación de un método a tiempo de ejecución (despacho dinámico).

>> No, es comun en lenguajes 
<[Si|No] [pero]...>

> La introspección y reflexibidad son conceptos que se manejan en la POO pero no guardar ninguna relación entre sí.

>> No, la instropciones la capacidad de algunos lenguajes de *examinar* el tipo o las propiedades de un objeto en tiempo de corrida, y reflexion es la habilidad para *modificar* el valor, para poder modificar un valor primero debe conocerse, luego, estan relacionados.

> En un lenguaje con un sistema de tipos dinámico la sobrecarga de métodos es innata y representa una comodidad dado que permite implementar un mismo método para distintos tipos.

<[Si|No] [pero]...>

> En los lenguajes POO existen los términos interfaz, módulo, clase abstracta, rol, etc; definidos como objetos que pueden encapsular definiciones de clases o implementaciones concretas de métodos.

<[Si|No] [pero]...>

> Los métodos virtuales permiten asociar, al momento de compilar, una implementación de un método sobrecargado con una llamada del mismo; eliminando el **overhead** del despacho dinámico.

<[Si|No] [pero]...>

> Cuando un lenguaje de POO tiene herencia simple no ocurre el problema del diamante pero de igual forma pueden existir llamadas ambiguas de métodos, dado que incorporar interfaces, módulos, protocolos, etc, no evita colisión de nombres.

<[Si|No] [pero]...>

> El paso de mensaje es un término que se maneja en modelos concurrentes, también de POO y es equivalente a la llamada de una función.

>> La equivalencia entre el paso de mensajes y la llamada a una funcion depende si es sincrono o no, si es asincrono, no es equivalente

> Sin importar la herencia del lenguaje de POO, una clase podría tener más de un ancestro.

>> Si, el tipo de herencia limita la cantidad de padres que puede tener una clase, pero es comun que una clase heredada a su vez herede de otras superclases.
