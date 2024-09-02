public class conditionaldemo {
    
    public static void Max(){
        Integer num1=20 ,num2=30;
        if (num1>num2){
            system.debug('num1 greater then num2');
        }else{
                system.debug('num2 greater then num1');
            }
    }
     public static void analysis(){
        Integer num = 0;
        if (num>0){
            system.debug('num is positive number');
         if(num>=0){
                system.debug('num is zero');
            }
        }
         else {
             system.debug('num is negative');
         }
    }
    }