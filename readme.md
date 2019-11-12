# Linux Commandline Assistant


![](logo.png)

An assistant in your daily and repetitive tasks with the linux shell. Created by and for developers!!

Image from: https://analyticstraining.com/difference-between-artificial-intelligence-machine-learning-and-deep-learning/

# Steps

- Clone this repository
- Choose a name for your assistant: jarvis, friday, alfred, etc. For this guide, we will use: **duke**
- Create a symlink, executing the following line inside the cloned folder:

```
ln -s $(pwd)/assistant.sh /usr/bin/duke
```
- set execute permissions

```
chmod +x /usr/bin/duke
```

- That's all folks.

# Invoke Assistant

If your assistant name is duke, you could invoke it, just typing its name in the shell:

```
duke

```
Response will be

```
Hi sr, I am duke
What Can I do for you? Tell me a command...
```

# Example

```
duke ip

```
Response will be

```
Hi sr, I am jarvis
Result of ip command is:

192.168.1.150
```

# New Commands

Just create new file with .sh extension in **commands** folder. File name will be the command name.


# Private Commands

Just create new file with .sh extension in **private_commands** folder. File name will be the command name. These private commands are scanned before community commands.

# Contribute

If you have some awesome command that could help to another developers in the world, just perform a **Pull Request** and I will review it!

# Variables

If you have complex commands which requires variables, just create a file called **variables**. Example:

```
JAVA_FOR_ECLIPSE=/../apps/jdk123
MAVEN_HOME=/../apps/apache-maven-3.6.0
POSTMAN_HOME=/../apps/Postman/
GIT_AUTHOR="JRichardsz<jrichardsz.java@gmail.com>"
ECLILPSE_HOME=/../apps/eclipse
```
All these variables will be present in any of your commands, so you could use it :D

# Contributors

Thanks goes to these wonderful people :

<table>
  <tbody>
    <td>
      <img src="https://avatars0.githubusercontent.com/u/3322836?s=460&v=4" width="100px;"/>
      <br />
      <label><a href="http://jrichardsz.github.io/">Richard Leon</a></label>
      <br />
    </td>    
  </tbody>
</table>

# License
Linux Command Line Assistant is open-sourced software licensed under the [MIT license](./LICENSE). Frameworks and libraries has it own licensed
