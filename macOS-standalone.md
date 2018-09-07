# Instalación y configuración de Hive


Esta guía describe la instalación y configuración detallada de Apache Hive 
en el sistema operativo Mac OS.

En los tutoriales se usará Apache Derby como base de datos.

## Modo Standalone

Este proceso de instalación supone que Hadoop se ejecutará en modo standalone.


### Paso 1

Descargue la versión más reciente de Apache Hive.

http://www.apache.org/dyn/closer.cgi/hive/


### Paso 2

Habrá `Terminal`, navegue hasta el directorio de descargas y descomprima Hive. 
Luego renombre el directory y copielo a su directorio de usuario.


```
tar -xzf apache-hive-x.y.z-bin.tar.gz
mv apache-hive-x.y.z-bin ~/hive
```

### Paso 3

Edite su archivo `.bash_profile` usando un editor de textos. Puede hacer esto desde
la línea de comandos con:

    nano ~/.bash_profile
    
Agregue los siguientes comandos (reemplazando `USERNAME` por su nombre de usuario):

```
export HIVE_HOME="/Users/USERNAME/hive"
export HIVE_CONF_DIR="$HIVE_HOME/conf"
# export CLASSPATH="$CLASSPATH:$HIVE_HOME/lib/*"
export PATH="$HIVE_HOME:$HIVE_HOME/bin:$PATH"
```

### Paso 4

Edite el archivo `hive-default.xml.template` 

     cd $HIVE_CONF_DIR 
     
     cp hive-default.xml.template hive-site.xml

y modifique la ubicación del `warehouse` y el `metastore`.



    <configuration>
      <property> 
        <name>hive.metastore.warehouse.dir</name> 
        <value>/Users/USERNAME/warehouse</value> 
        <description>
          Especifica la ubicacion en el disco duro de la bodega de datos.
          Reemplace USERNAME por su usuario
        </description> 
      </property> 
      <property>
        <name>hive.metastore.local</name>
        <value>true</value> 
        <description>
           El metastore es local
        </description> 
      </property> 
      <property>
        <name>javax.jdo.option.ConnectionURL</name>
          <value>jdbc:derby:;databaseName=/User/USERNAME/metastore_db;create=true</value>
          <description>
             Conexion y ubicacion del metasotre.
             Remmplace USERNAME por su nombre de usuario.
          </description> 
      </property>
    </configuration>


Luego agrege las siguientes propiedades al inicio de la configuración.

    <property>
      <name>system:java.io.tmpdir</name>
      <value>/tmp/hive/java</value>
    </property>
    <property>
      <name>system:user.name</name>
      <value>${user.name}</value>
    </property>


### PASO 5

En Terminal, vaya al directorio de instalación de Apache Hive

    cd ~/
    
Luego inicialice la base de datos:

    $HIVE_HOME/bin/schematool -dbType derby -initSchema

En algunos sistemas el comando falla porque existen caracteres extraños en
el archivo `hive-site.xml`. Edite el archivo a mano.


### PASO 6

Entre a Hive y ejecute algunos comandos para verificar la instalación. 
Salga con el comando `quit;`.


# Ignorar de aca hacia abajo

## Modo Pseudo-distribuido

### PASO 4






### Paso 4

Cree los directorios de trabajo para ejecutar Hive en el modo *standalone* de Hadoop. Use los siguientes comandos.

```
$HADOOP_HOME/bin/hadoop fs -mkdir  /tmp
```

```
$HADOOP_HOME/bin/hadoop fs -mkdir /user/hive/warehouse
```

```
$HADOOP_HOME/bin/hadoop fs -chmod g+w  /tmp
```

```
$HADOOP_HOME/bin/hadoop fs -chmod g+w   /user/hive/warehouse
```

Verifique la instalación. Para ello, cierre y habra `Terminal`. Luego digite `$HIVE_HOME/bin/hive` en la línea de comandos. Como resultado, debe imprimirse el prompt de Hive en la pantalla. Salga de Hive con el comando `quit;`.


set hive.metastore.warehouse.dir=/user/myname/hive/warehouse;
