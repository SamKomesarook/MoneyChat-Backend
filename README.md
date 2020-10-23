# MoneyChat-Backend

### To use an ejabberd module coming from this repository:

You need to have ejabberd installed.

If you have not already done it, run `ejabberdctl modules_update_specs` to retrieve the list of available modules.

Run `ejabberdctl module_install <module>` to get the source code and to compile and install the beam file into ejabberd's module search path. This path is either ~/.ejabberd-modules or defined by the CONTRIB_MODULES_PATH setting in ejabberdctl.cfg.

Edit the configuration file provided in the conf directory of the installed module and update it to your needs. Then apply the changes to your main ejabberd configuration. In a future release, ejabberd will automatically add this file to its runtime configuration without changes.

Run `ejabberdctl module_uninstall <module>` to remove a module from ejabberd.
