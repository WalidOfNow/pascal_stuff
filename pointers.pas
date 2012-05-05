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
function addz(var a,b:holemat;n,m:integer) : holemat;
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

        if s^.col = re.col then
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
          else if s^.col < re.col then
           begin
            p:=s;
            s:=s^.pnext;
           end
          else
           loc:=true;
      end;
{
      if (s^.col) <> (re.col) then
       begin}
        temp^.pnext:=s;
        if s=ls then
         ls:=temp
        else
         p^.pnext:=temp;
       {end;}
    end;
  end;

procedure xread(var ss:holemat; n,m:integer);
  var i,x:integer;  c,d:char;   xx:emat;
  begin
    i:=1;
    d:='y'; x:=1;
    while x=1 do
     begin
      write('enter the row number of the element : ');
      readln(i);
       while (i>n) or (i<1) do
        begin
         writeln('plz enter  0 < row <',n);
         write('re enter the row number of the element : ');
         readln(i);
        end;
      writeln('you are in line number  ',i);
     {  while (ord(c)=ord('y')) or (ord(c)=ord('Y')) do
        begin}
         write('enter the column number of the element : ');
         readln(xx.col);
         while (xx.col>m) or (xx.col<1) do
          begin
           writeln('plz enter  0 < column <',m);
           write('re enter the column number of the element : ');
           readln(xx.col);
          end;
          writeln('enter the element value :');
          read(xx.val);
          if(xx.val<>0)then
           inz(ss[i],xx);
          write('Do you want to add new element...Y/N....?? : ');
          readln(x);
        {end;}
     end;
  end;


function addz(var a,b:holemat;n,m:integer) : holemat;
 var
 s1,s2:pemat;
 reco:emat;
 i:integer;
 p:boolean;
 begin
  p:=false;

  for i:=1 to n do
   begin
    a[i]:=nil;
    b[i]:=nil;
   end;
  writeln('the first array');
  xread(a,n,m);
  writeln('the second one');
  xread(b,n,m);
  for i:=1 to n do
   begin
    s1:=a[i];
    s2:=b[i];
    writeln('s1',s1^.col);
    while s1<>nil do
     begin
      while s2<>nil do
       begin
        if s1^.col = s2^.col then
         begin
          p:=true;
          s2^.val:=s2^.val+s1^.val;
         end
         else
           writeln('s2',s2^.col);
          s2:=s2^.pnext;

        end;
         s2:=b[i];
         if not p then
          begin
           reco.val:=s1^.val;
           reco.col:=s1^.col;
           inz(s2,reco);
          end;
       p:=false;
       s1:=s1^.pnext;
    end;
  end;
  addz:=b;
 end;
begin
ls:=nil;
end.
