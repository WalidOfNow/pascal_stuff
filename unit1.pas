unit pointers;

interface
 const MaxN=100;
 type pemat = ^emat;
  emat = record
   col:integer;
   val:real;
   pnext:pemat;
  end;
 type HoleMat = array[1..MaxN] of pemat;
 var
 ls:pemat;
 re:emat;
procedure inz(var ls:pemat;re:emat);
implementation
 
 procedure inz(var ls:pemat;re:emat);
  var
   temp,s,p:pemat;
   loc:boolean;
   c:char;
  begin
   new(temp);
   temp^.col:=re.col;
   temp^.val:=re.val;
   temp^.pnext:=nil;
   if ls=nil then
    ls:=temp
   else
    begin
     loc:=false;
     s:=ls;
     while (s<>nil) and (not loc)  do
      begin
       if s^.col < re.col then
        begin
         p:=s;
         s:=s^.pnext;
        end
        else if s^.col = re.col then
         begin
          writeln('The column is exist!! Do you want to overwrite it?....Y/N... ');
          read(c);
          while (ord(c)<>ord('n')) and (ord(c)<>ord('N')) do
           begin
            if (ord(c)=ord('y')) or (ord(c)=ord('Y')) then
             begin
              s^.val:=re.val;   
              c:='n'
             end
             else
             begin
              writeln('plz enter Y or N !!');
              readln(c);
             end;
            loc:=true;
           end;
          end
          else
           loc:=true;
      end;
      if s^.col <> temp^.col then
       begin
        temp^.pnext:=s;
        if s=ls then
         ls:=temp
        else
         p^.pnext:=temp;
       end;
    end;
  end;
{
procedure xread(var ss:holemat; n:integer);
  var i,j:integer;  c:char;   xx:emat;
  begin
    i:=1;  j:=1;
    for i:=1 to n do
     begin
       top:=nil
       writeln('you are in line number  ',i);
       writeln('do you want to add any element in this line..?? y\n');
       readln(c);
       while (c='y')or (c='Y') do
        begin
          writeln('enter the num of col');
          readln(xx.j);
          if(xx.j>maxN)and(xx.j<0)then
           writeln('plz readd the   0 < num < 100')
          else
           begin
             writeln('enter the value');
             readln(xx.val);
             if(xx.val<>0)then
               insert(top,xx);
           end;
          writeln('Do you want to add new value in same line...??');
          readln(c);
        end;
     end;
  end;


function add(var a,b:holemat) : holemat;
 var
 s1,s2:pemat;
 reco:emat;
 i:integer;
 
 begin
  writeln('enter the rang of array');
  readln(n);
  writeln('the first array');
  xread(a,n);
  writeln('the second one');
  xread(b,n);
  for i:=1 to n do
   begin
    s1:=a[i];
    s2:=b[i];
    while s1<>nil do
     begin
       while s2<>nil do
        begin
         if s1^.col = s2^.col then
          begin
           b:=true;
           s2^.val:=s2^.val+s1^.val;
          end
          else
          begin
           reco.val:=s1^.val;
           reco.col:=s1^.col;
           inz(s2,reco);
           b:=false;
          end;
	end;
    end;
  end;
  add:=b;	
  }
begin
ls:=nil;
end.
