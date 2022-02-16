REM disables open with app and defaults for edge for html and pdfs
REM https://eddiejackson.net/wp/?p=16195
REM https://www.petenetlive.com/KB/Article/0001395
REG ADD "HKEY_CURRENT_USER\Software\Classes\AppX4hxtad77fbk3jkkeerkrm0ze94wjf3s9" /v NoStaticDefaultVerb /t REG_SZ /f
REG ADD "HKEY_CURRENT_USER\Software\Classes\AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723" /v NoStaticDefaultVerb /t REG_SZ /f
REG ADD "HKEY_CURRENT_USER\Software\Classes\AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723" /v NoOpenWith /t REG_SZ /f
REG ADD "HKEY_CURRENT_USER\Software\Classes\AppX4hxtad77fbk3jkkeerkrm0ze94wjf3s9" /v NoOpenWith /t REG_SZ /f

