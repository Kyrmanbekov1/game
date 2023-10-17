import 'dart:io';
import 'dart:math';

void main(){
  Random random = Random();
  int min = 1;
  int max = 100;
  int compattempts = 0;
  int responsecomp;
  print('Добро пожаловать в игру');
  print('Загадайте число от $min до $max');
  //int randomNum = int.tryParse(stdin.readLineSync()?? '')?? 0 ;

  int left = min;
  int right = max;

  do {
     responsecomp = left + ((right - left)  ~/ 2); //random.nextInt(right - left + 1) ;
   print('Попытка $compattempts: Компьютер предполагает, что ваше число равно $responsecomp');
compattempts++;
   
   print('Компьбтер прав?');
   String? str = stdin.readLineSync()?? '';
    if(str == 'ВЫ угадали'){
    print('Поздравляю вы угадали загаданное число за $compattempts ');
      break;

    }else if(str == 'меньше'){
      right = responsecomp - 1;  
    
    }else if(str == 'больше'){
      left = responsecomp - 1;
    }
    
    
    

 
  
  } while (true);
  
  
  
}