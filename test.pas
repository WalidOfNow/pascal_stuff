program dodo;
uses pointers;
var
 lss,s,s11:pemat;
 reco:emat;
 i:integer;
 a,b,c:holemat;
 n,m:integer;
begin
{
lss:=nil;
for i:=1 to 3 do
begin
readln(reco.col);
readln(reco.val);
inz(lss,reco);
end;
s:=lss;
while s^.pnext<>nil do
begin
writeln(s^.val,'    ',s^.col);
s:=s^.pnext;
end;}
writeln('........enter the rang of the two arrays........');
  writeln('enter the number of lines/rows : ');
    read(n);
      while (n>100) or (n<1) do
         begin
             writeln('enter number bitween 1 and ',maxn,'!!!');
                 writeln('re enter the number of lines/rows : ');
                     read(n);
                        end;
                          writeln('now enter tne number of columns : ');

                          read(m);
                              while  m<1 do
                                 begin
                                     writeln('enter number larger than 1 !!!!');
                                         writeln('re enter the number of columns : ');
                                             read(m);
                                                end;
                                                writeln('n : ',n);
c:=addz(a,b,n,m);
for i:=1 to n do
 begin
  s11:=a[i];
  s:=c[i];
  writeln('         ',i,i,i,i,i,i,'  ');
  while s<>nil do
  begin
   write(' ',s^.col,' ',s^.val:3:2);
   s:=s^.pnext;
   end;
  {   while s11<>nil do
  begin
    write(' ',s11^.col,' ',s11^.val:3:2);
   s11:=s11^.pnext;
  end;           }
  writeln;
 end;
readln;
end.
