Available states
----------------

The following states are found in this formula:

.. contents::
   :local:


``tool_rbw``
~~~~~~~~~~~~
*Meta-state*.

Performs all operations described in this formula according to the specified configuration.


``tool_rbw.package``
~~~~~~~~~~~~~~~~~~~~
Installs the rbw package only.


``tool_rbw.package.cargo``
~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_rbw.package.pkg``
~~~~~~~~~~~~~~~~~~~~~~~~



``tool_rbw.config``
~~~~~~~~~~~~~~~~~~~
Manages the rbw package configuration by

* recursively syncing from a dotfiles repo
* managing/serializing the config file afterwards

Has a dependency on `tool_rbw.package`_.


``tool_rbw.config.file``
~~~~~~~~~~~~~~~~~~~~~~~~
Manages the rbw package configuration.
Has a dependency on `tool_rbw.package`_.


``tool_rbw.config.sync``
~~~~~~~~~~~~~~~~~~~~~~~~
Syncs the rbw package configuration
with a dotfiles repo.
Has a dependency on `tool_rbw.package`_.


``tool_rbw.completions``
~~~~~~~~~~~~~~~~~~~~~~~~
Installs rbw completions for all managed users.
Has a dependency on `tool_rbw.package`_.


``tool_rbw.clean``
~~~~~~~~~~~~~~~~~~
*Meta-state*.

Undoes everything performed in the ``tool_rbw`` meta-state
in reverse order.


``tool_rbw.package.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~
Removes the rbw package.
Has a dependency on `tool_rbw.config.clean`_.


``tool_rbw.package.cargo.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_rbw.package.pkg.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_rbw.config.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~
Removes the configuration of the rbw package.


``tool_rbw.completions.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Removes rbw completions for all managed users.


