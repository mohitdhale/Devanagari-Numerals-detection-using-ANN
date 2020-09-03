a=[43 3 0 2 3 2 0 2 0 1;3 45 2 0 0 0 0 0 1 0;1 1 45 2 0 4 0 0 0 0;0 0 0 46 0 0 1 1 0 0;
   0 1 0 0 43 0 1 2 0 1;0 0 1 0 1 44 0 0 0 0;1 0 1 0 0 0 48 1 0 0;2 0 0 0 3 0 0 44 0 0;
   0 0 0 0 0 0 0 0 48 3;0 0 1 0 0 0 0 0 1 45]

xxx=(sum(a));
tpn=sum(diag(a));
tp=diag(a)';

for i=1:size(a,1)
        tn(i)=tpn-tp(i);
        fn(i)=sum(a(i,:))-a(i,i);
        fp(i)=sum(a(:,i))-a(i,i);
end

for i=1:size(a,1)

    acc(i)=((tp(i)+tn(i))/(tp(i)+fp(i)+fn(i)+tn(i)))*100; %Accuracy

    prec(i)=(tp(i)/(tp(i)+fp(i)))*100; %precision or positive predictive value

    sen(i)=(tp(i)/(tp(i)+fn(i)))*100; %sensitivity, recall, hit rate, or true positive rate 

    spec(i)=(tn(i)/(fp(i)+tn(i)))*100; %specificity, selectivity or true negative rate 

    fscor(i)=(sen(i)*prec(i)*2)/(sen(i)+prec(i)); %F1 score is the harmonic mean of precision and sensitivity

    npv(i)=((tn(i)/(tn(i)+fn(i))))*100; %negative predictive value (NPV)

    FOR(i)=((fn(i)/(fn(i)+tn(i))))*100; %false omission rate (FOR)

    ccc=npv+FOR;

end

disp('Accuracy Precision Sensitivity Specificity F1-score NPV  FOR')

all=[acc' prec' sen' spec' fscor' npv' FOR' ccc']

disp('Overall Acc(%)')

acc=tpn/sum(sum(a))*100