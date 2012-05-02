unit pointers;

interface
 const MaxN=100;
 type pemat = ^emat;
 type emat = record
   col:integer;
   val:real;
   pnext:pemat;
  end;
 type HoleMat = array[1..MaxN] of pemat;
 var
 ls:pemat; 
 re:emat;
 inz(ls,re);
implementation
 procedure inz(var ls:pemat;re:emat);
  var
   temp,s,p:lp;
   loc:boolean;
  begin
   new(temp);
   temp^.col:=re.col;
   temp^.val:=re.val;
   temp^.next:=nil;
   if ls=nil then
    ls:=temp
   else
    begin
     loc:=false;
     s:=ls;
     while (s<>nil) and (not loc)  do
      begin
       if s^.col > re.col1 then
        begin
         p:=s;
         s:=s^.next;
        end
        else if s^.col = re.col then
         begin
          writeln('The column is exist!! Do you want to overwrite it?....Y/N... ');
          read(c);
          while c<>'n' or c<>'N' do
           begin
            if c='y' or c='Y' then
             begin
              s^.val:=re.val;
              c:='n'
             end
             else
             begin
              writeln('plz enter Y or N !!');
              readln(c);
             end;
            end;
            loc:=true;
          end
          else
           loc:=true;
      end;

      if s^.col <> re.col then
       begin
        temp^.next:=s;
         p^.next:=temp;
       end

    end;
  end;
begin
ls:=nil;
end.
