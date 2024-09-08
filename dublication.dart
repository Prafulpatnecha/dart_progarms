
import 'dart:io';

void main()
{
  Dublication dublication = Dublication();
  dublication.duplicateFind();
}

class Dublication
{
  void duplicateFind()
  {
    List list = [];
    stdout.write("Enter The Value Of Size In Array : ");
    int n = int.parse(stdin.readLineSync()!);
    // print(n);

    for(int i=0; i<n; i++)
    {
      List addList= [];
      for(int j=0; j<3;j++)
      {
        stdout.write("Enter list [$i][$j] : ");
        addList.add(int.parse(stdin.readLineSync()!));
      }
        list.add(addList);
    }
    // print(list.toSet());
    // print(list.length);
    int d=1;
    List addList = [];
    for(int i=0;i<list.length;i++)
    {
      // int value=0;
      for(int ij=0;ij<list[i].length;ij++)
      {
        for(int k=d;k<list.length;k++)
        {
          for(int j=0; j<list[i].length; j++)
          {
            if(list[i][ij]==list[k][j])
            {
              addList.add("$i $k $j");
            }
          }
        }
      }
      d++;
    }

    addList = addList.toSet().toList();

    for(int i=0; i<addList.length;i++)
    {
      addList[i] = addList[i].toString().split(" ").sublist(0,2).join(" ");
    }

    // print(addList); //todo That comment is open than detail will explain code 

    List join = [];
    join=addList.toSet().toList(); 
    print(join);
    List valueList =[];
    for(int i=0;i<join.length;i++)
    {
      int value = 0;
      for(int j=0; j<addList.length; j++)
      {
        if(join[i]==addList[j])
        {
          value++;
        }
      }
      if(value==3)
      {
        valueList.add(int.parse(join[i][2]));
          print("object : ${join[i][2]}");
      }
    }
    if(valueList.isNotEmpty)
    {
    print("");
    print("");
    addList = valueList.toSet().toList();
    // print(addList);//todo That comment is open than detail will explain code
    print("");
    do{
        list.removeAt(addList.reduce((value, element) => (value>element)? value : element,));
        // print("Last Value : ${addList.reduce((value, element) => (value>element)? value : element,)}");//todo That comment is open than detail will explain code
      addList.remove(addList.reduce((value, element) => (value>element)? value : element,));
    }while(0<addList.length);
    }
    print(list);
  }
}

// WAP to remove duplicate array from 2D array. where each array of 2D array has a fixed 3 element.
// ex. 
// int arr[n][3].
// Input array : {{1,2,3},{3,4,5},{4,5,6},{2,3,1}}
// Output array: {{1,2,3},{3,4,5},{4,5,6}}

// ex2. 
// Input array: {
// {1,0,1},
// {-1,1,0},
// {0,-1,1},
// {1,0,1}}
// Output array: {{1,0,1},{-1,1,0}}

// Note. order element are not necessary to be maintained.
