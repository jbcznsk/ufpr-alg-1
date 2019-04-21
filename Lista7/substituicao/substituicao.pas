program substituicao;
type 
    vetor = array[1..200] of integer;

var 
    v1,v2,v3 : vetor;
    t1,t2,t3 : integer;
    pos_inicio, pos_final : integer;


//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

procedure lerVetor(var v: vetor; var t : integer);
var 
    num : integer;
begin
    t:= 0;
    read(num);
    while(num <> 0) do 
    begin
        t := t + 1; 
        v[t] := num;
        read(num);
    end;
end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

procedure imprimeVetor(v:vetor; t : integer);
var i : integer;
begin
    for i := 1 to t do write(v[i],' ');
end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

function ocorre(v1,v2 : vetor ; t1,t2 : integer; var posi, posf : integer) : boolean;
var
    i, c : integer;

begin
    i := 0; 
    ocorre := false;

    while (i + t2 < t1) and not ocorre do 
    begin
        ocorre := true;
        for c:= 1 to t2 do 
            if v1[i + c] <> v2[c] then ocorre := false;
        i := i + 1;
    end;
    if ocorre then 
    begin
        posi := i;
        posf := i + t2;
        writeln('POSI = ', posi, ' || POSF = ', posf);
    end;
end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

procedure substituirVetor(var vet1,vet3 : vetor; pi, pf : integer);
var 
    i : integer;
begin
    for i := 0 to (pf-pi) do 
    begin
        vet1[pi + i] := vet3[i + 1];
    end; 
end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

begin
    lerVetor(v1,t1);
    lerVetor(v2,t2);
    lerVetor(v3,t3);
    //imprimeVetor(v1, t1);
    //writeln;
    //imprimeVetor(v2, t2);
    //writeln;
    //imprimeVetor(v3, t3);
    //writeln;


    if ocorre(v1, v2, t1, t2, pos_inicio,pos_final) then 
    begin
        //writeln('SIM');
        substituirVetor(v1,v3,pos_inicio, pos_final);
    end;

    //imprimeVetor(v1, t1);
    imprimeVetor(v1, t1);
    writeln;

end.