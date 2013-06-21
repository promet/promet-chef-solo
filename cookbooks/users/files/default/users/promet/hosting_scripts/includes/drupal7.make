; #### Core version
; ----------------
core = 7.x

; #### API version
; Every makefile needs to declare it's Drush Make API version. This version of
; drush make uses API version `2`.
; ----------------

api = 2

; #### Core project
; ----------------

projects[] = drupal

; #### Projects
; This will, by default, retrieve the latest recommended version of the project
; If you want to retrieve a specific version of a project:

; Modules
projects[admin_menu][version] = "3.0-rc3"
projects[admin_menu][subdir] = "contrib"
projects[advanced_help][version] = "1.0"
projects[advanced_help][subdir] = "contrib"
projects[ctools][version] = "1.0"
projects[ctools][subdir] = "contrib"
projects[coder][version] = "1.0"
projects[coder][subdir] = "contrib"
projects[context][version] = "3.0-beta3"
projects[context][subdir] = "contrib"
projects[date][version] = "2.5"
projects[date][subdir] = "contrib"
projects[devel][version] = "1.2"
projects[devel][subdir] = "contrib"
projects[devel_themer][version] = "1.x-dev"
projects[devel_themer][subdir] = "contrib"
projects[entity][version] = "1.0-rc3"
projects[entity][subdir] = "contrib"
projects[features][version] = "1.0-rc2"
projects[features][subdir] = "contrib"
projects[media][version] = "1.1"
projects[media][subdir] = "contrib"
projects[entityreference][version] = "1.0-rc3"
projects[entityreference][subdir] = "contrib"
projects[pathauto][version] = "1.1"
projects[pathauto][subdir] = "contrib"
projects[redirect][version] = "1.0-beta4"
projects[redirect][subdir] = "contrib"
projects[strongarm][version] = "2.0-rc1"
projects[strongarm][subdir] = "contrib"
projects[token][version] = "1.1"
projects[token][subdir] = "contrib"
projects[views][version] = "3.3"
projects[views][subdir] = "contrib"
projects[webform][version] = "3.18"
projects[webform][subdir] = "contrib"
