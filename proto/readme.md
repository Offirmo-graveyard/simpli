require "for system tool:xyz#^1.0.9"

require "for system user:toto"

require "for user:toto tool:nvm#1.4"

require "for user:toto nvm#1.4/node#0.12.7"

require "for user:toto/nvm#1.4/node#0.12.7 global_npm_module:nodemon#3.10"





require "for system tool:xyz#^1.0.9"

require "for system user:toto as main_user"

require "for main_user tool:nvm#1.4 as nvm"

require "for main_user/nvm node#0.12.7 as node"

require "for main_user/node global_npm_module:nodemon#3.10"


PATH
user = x (sourcé)
nvm = x (sourcé)
node = x (sélectionné)

