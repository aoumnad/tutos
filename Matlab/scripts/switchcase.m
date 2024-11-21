fprintf('\n\n');
disp('1   :   FRANCAIS');
disp('2   :   ENGLISH');
disp('3   :   ITALIANO');
k = input('\nfaites votre choix   :  ');
fprintf('\n\n');
switch k
   case 1
      disp('Bonjour');
      nom = input('Veuillez introduire votre nom  : ','s');
      disp(['A bientôt   ' nom])
   case 2
      disp('Hello  !');
      nom = input('Please, introduce your name  : ','s');
      disp(['See you later   ' nom])
   case 3
      disp('désolé, je ne parle pas italien');
      disp('sorry, I do not speek italien');
   otherwise
      fprintf('\nvous n''avez pas fait le bon choix\n');
end;
