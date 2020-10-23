# MoneyChat-Backend

### How to Write a Custom Module
All ejabberd modules are implementing the gen_mod behaviour. It means that a module must provide the following API:

```
start(Host, Opts) -> ok
stop(Host) -> ok
depends(Host, Opts) -> []
mod_options(Host) -> []
```

Host is the name of the virtual host running the module. The start/2 and stop/1 functions are called for each virtual host at start and stop time of the server.

Opts is a lists of options as defined in the configuration file for the module. They can be retrieved with the gen_mod:get_opt/3 function.

You can install the [mod_hello](mod_hello) module to see how these function works.


### To use an ejabberd module coming from this repository:

You need to have ejabberd installed.

If you have not already done it, run `ejabberdctl modules_update_specs` to retrieve the list of available modules.

Run `ejabberdctl module_install <module>` to get the source code and to compile and install the beam file into ejabberd's module search path. This path is either ~/.ejabberd-modules or defined by the CONTRIB_MODULES_PATH setting in ejabberdctl.cfg.

Edit the configuration file provided in the conf directory of the installed module and update it to your needs. Then apply the changes to your main ejabberd configuration. In a future release, ejabberd will automatically add this file to its runtime configuration without changes.

Use `ejabberdctl module_check <module>` to ensure it compiles correctly before committing your work. The sources of your module must be located in $CONTRIB_MODULES_PATH/sources/<module>.

Run `ejabberdctl module_uninstall <module>` to remove a module from ejabberd.

### Start the Ejabberd Server
You can run `ejabberdctl start` to start the server in the background, or use `ejabberdctl live` to start the server in the foreground and it will display the logs in the terminal. 


### Module Directory Structure
The module directory structure is usually the following:
```
README.txt: Module description.  
COPYING: License for the module.  
doc/: Documentation directory.  
src/: Erlang source directory.  
lib/: Elixir source directory.  
priv/msgs/: Directory with translation files (pot, po and msg).  
conf/<module>.yml: Configuration for your module.  
<module>.spec: Yaml description file for your module.  
```

### Reference
[Ejabberd Custom Module](https://docs.ejabberd.im/developer/extending-ejabberd/modules/)
