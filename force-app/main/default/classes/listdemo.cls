public class listdemo {
    
    public static list<string> returndemo(){
        List<string> colors= new List<string>();
        colors.add('Red');
        colors.add('blue');
        return colors;
    }
    public static void listdemomethod(){
        List<string> returnedvalues= new List<string>();
        returnedvalues = returndemo();
        List<string> colors= new List<string>();
        colors.add('Red');
        colors.add('blue');
        system.debug('Colors List contains='+colors);
        
        colors.add(1,'Green');
        system.debug('Colors List contains='+colors);
        
        
        List<string> colorslist2= new List<string>();
        colorslist2.add('black');
        colorslist2.add('purbel');
        colors.addAll(colorslist2);
        system.debug('Colors List contains='+colors);
    } 
}