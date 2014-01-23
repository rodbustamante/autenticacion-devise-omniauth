## Ejemplo de autenticación con múltiples proveedores usando Devise y Omniauth

Hice este repo y este **[post](http://rodrigopuente.com/autenticando-usuarios-en-ror-con-omniauth/)** porque la documentación para hacer autenticación con múltiples proveedores conectados a un usuario en las versiones recientes de Devise y Omniauth no existe y uno tiende a toparse con bastante errores por cuestiones que están *deprecated* o que simplemente ya no funcionan así. Además que dicha documentación en español es aún más difícil de encontrar.

A tomar en cuenta:

* Usé ruby 2.0.0 y rails 4.0.2.
* Deben configurar la base de datos con su usuario y contraseña.
* Deben ingresar las llaves de las aplicaciones que creen en **Facebook** y **Twitter** dentro del archivo de configuración de devise (*config/initializers/devise.rb*).

Pueden escribirme cualquier pregunta aquí, o en [twitter](http://twitter.com/ro_puente).