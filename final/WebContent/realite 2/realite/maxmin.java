import java.io.*;
import java.util.*;

class Series{
  int n;
  int a, b, c;

  public void inputlimit(){
    System.out.println("Enter the total no of terms for the fibonacci series");
    Scanner scanner = new Scanner(System.in);
    n = scanner.nextInt();
  }

  public void assign(){
    a = 0;
    b = 1;
  }

  public void generateseries(){
    System.out.println(a);
    System.out.println(b);

    for(int i=0; i<n-2; i++){
      c = a + b;
      System.out.println(c);
      a = b;
      b = c;
    }
  }
}

public class maxmin extends Series{
  int[] ar = new int[20];
  int s;
  int gn, sn;

  public void readarray(){
    System.out.println("Enter the no of elements in the array and then the elements of the array");
    Scanner scanner = new Scanner(System.in);
    s = scanner.nextInt();
    for(int i=0; i<s; i++){
      ar[i] = scanner.nextInt();
    }
    scanner.close();
  }

  public void findmaxmin(){
    gn = ar[0];
    sn = ar[0];
    for(int i=1; i<s; i++){
      if(ar[i]>gn) gn=ar[i];
      if(ar[i]<sn) sn=ar[i];
    }
    System.out.println(gn);
    System.out.println(sn);
  }

  public void printresults(){
    maxmin demo = new maxmin();
    demo.inputlimit();
    demo.assign();
    demo.generateseries();
    demo.readarray();
    demo.findmaxmin();
  }
}
