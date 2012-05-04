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
       
       temp^.pnext:=s;
	   {
     if s^.col = temp^.col then
      begin
         temp:=s;
         s:=s^.pnext;
         dispose(temp);
      end;}
      if s=ls then
        ls:=s
      else
        p^.pnext:=temp;

    end;
  end;

procedure xread(var ss:holemat; n:integer);
  var  xx:emat;   i,j:integer  top:pemat;
  begin
    i:=1; j:=1;      top:=nil;
    while i<=n do
     begin
      writeln('enter u=the num of line');
      readln(i)
      while j<= n and c='y' do
       begin
         writeln('enter the num of cal');
         readln(xx.j);
         writeln('enter the elemant');
         readln(xx.a);
         inz(top,xx);
         writeln('do u want to add new element in the same line...... Y\N');
         readln(c);
       end
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
  
begin
ls:=nil;
end.
