public class Rectangularconstractor {
    integer length,breadth;
    
    public Rectangularconstractor(integer l, integer b){
       length = l;
       breadth = b;
    }
    
    public void area(){
        integer a = length * breadth;
        System.debug('area = ' + a );
            }

}