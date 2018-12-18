
bank = 1;
care = 2;
commerce = 3;
elec = 4;
energy = 5;
food = 6;
mat = 7;
preto = 8;
property = 9;
tech = 10;
tran = 11;

sector = input('Choosen a sector : ');
fprintf('\n');

if sector == 1
    bankX = xlsread('C:\Users\asus10\Desktop\sectorTrain\bank\bank_data.csv');
    bankY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\banking_train_pbv.csv');
    
    Bankdata = bankX( : ,[6 12]);
    MdlBank = fitcknn(Bankdata,bankY,'NumNeighbors',1);
    rloss_bank = resubLoss(MdlBank);
    Bank_cvmodel = crossval(MdlBank);
    loss_bank = kfoldLoss(Bank_cvmodel);
    accuracy_bank = 100.00-(rloss_bank*100);
    
    fprintf('Bank Industry \n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Bank sector = ',loss_bank);
    %disp(loss_bank);
    %fprintf('Accuracy value of Bank sector = ', accuracy_bank);
    %disp(accuracy_bank);
    
    x_bank = [1 2 3 4];
    pbv_bank = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_bank = polyfit(x_bank,pbv_bank,1);
    Mpbv_bank = Ppbv_bank(1:1);
    roa_bank = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_bank = polyfit(x_bank,roa_bank,1);
    Mroa_bank = Proa_bank(1:1);
    Mtotal_bank = [Mpbv_bank,Mroa_bank];
    
    P_bank = predict(MdlBank,Mtotal_bank);
    fprintf('Result of Predicted for Bank : ', P_bank);
    disp(P_bank);
    if P_bank == 0
        disp('Recommend to Hold Stock');
    elseif P_bank == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end   
    
    gscatter(bankX(:,6),bankX(:,12),bankY(:,1));
    hold on
    gscatter(Mpbv_bank,Mroa_bank,P_bank,'k','x'); 
    xlabel('mP/BV')
    ylabel('mROA')
    title('Bank')
    
    %Mpbv = 0.05;
    %Mroa =-0.15;
    %gscatter(bankX(:,6),bankX(:,12),bankY(:,1));
    %hold on
    %gscatter(Mpbv,Mroa,P_bank,'k','x'); 
    %Mtotal = [Mpbv,Mroa];
    %P_bank = predict(MdlBank,Mtotal)
    
 
elseif sector == 2
    careX = xlsread('C:\Users\asus10\Desktop\sectorTrain\care\care_data.csv');
    careY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\care_train_pbv.csv');
    
    caredata = careX( : ,[6 12]);
    MdlCare = fitcknn(caredata,careY,'NumNeighbors',3);
    rloss_care = resubLoss(MdlCare);
    Care_cvmodel = crossval(MdlCare);
    loss_care = kfoldLoss(Care_cvmodel);
    accuracy_care = 100.00-(rloss_care*100);
    
    fprintf('Heath care service Industry \n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Heath care service sector = ', loss_care);
    %disp(loss_care);
    %fprintf('Accuracy value of Heath care service sector = ', accuracy_care);
    %disp(accuracy_care);
    
    x_care = [1 2 3 4];
    pbv_care = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_care = polyfit(x_care,pbv_care,1);
    Mpbv_care = Ppbv_care(1:1);
    roa_care = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_care = polyfit(x_care,roa_care,1);
    Mroa_care = Proa_care(1:1);
    Mtotal_care = [Mpbv_care, Mroa_care];
    
    P_care = predict(MdlCare,Mtotal_care);
    fprintf('Result of Predicted for Heath care service : ', P_care);
    disp(P_care);
    if P_care == 0
        disp('Recommend to Hold Stock');
    elseif P_care == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end 
    
    
    gscatter(careX(:,6),careX(:,12),careY(:,1));
    hold on
    gscatter(Mpbv_care, Mroa_care,P_care,'k','x'); 
    xlabel('mP/BV')
    ylabel('mROA')
    title('Heath care service')
    
elseif sector == 3
    commerceX = xlsread('C:\Users\asus10\Desktop\sectorTrain\commerce\commerce_data.csv');
    commerceY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\commerce_train_pbv.csv');
    
    commercedata = commerceX( : ,[6 12]);
    Mdlcommerce = fitcknn(commercedata,commerceY,'NumNeighbors',3);
    rloss_commerce = resubLoss(Mdlcommerce);
    commerce_cvmodel = crossval(Mdlcommerce);
    loss_commerce = kfoldLoss(commerce_cvmodel);
    accuracy_commerce = 100.00-(rloss_commerce*100);
    
    fprintf('Commerce Industry \n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Commerce sector = ', loss_commerce);
    %disp(loss_commerce);
    %fprintf('Accuracy value of Commerce sector = ', accuracy_commerce);
    %disp(accuracy_commerce);
    
    x_commerce = [1 2 3 4];
    pbv_commerce = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_commerce = polyfit(x_commerce,pbv_commerce,1);
    Mpbv_commerce = Ppbv_commerce(1:1);
    roa_commerce = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_commerce = polyfit(x_commerce,roa_commerce,1);
    Mroa_commerce = Proa_commerce(1:1);
    Mtotal_commerce = [Mpbv_commerce,Mroa_commerce];
    
    P_commerce = predict(Mdlcommerce,Mtotal_commerce);
    fprintf('Result of Predicted for Commerce : ', P_commerce);
    disp(P_commerce);
    if P_commerce == 0
        disp('Recommend to Hold Stock');
    elseif P_commerce == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end 
    
    gscatter(commerceX(:,6),commerceX(:,12),commerceY(:,1));
    hold on
    gscatter(Mpbv_commerce,Mroa_commerce,P_commerce,'k','x')
    xlabel('mP/BV')
    ylabel('mROA')
    title('Commerce')

elseif sector == 4
    elecX = xlsread('C:\Users\asus10\Desktop\sectorTrain\elec\delta_data.csv');
    elecY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\delta_train_pbv.csv');
    
    elecdata = elecX( : ,[6 12]);
    Mdlelec = fitcknn(elecdata,elecY,'NumNeighbors',3);
    rloss_elec = resubLoss(Mdlelec);
    elec_cvmodel = crossval(Mdlelec);
    loss_elec = kfoldLoss(elec_cvmodel);
    accuracy_elec = 100.00-(rloss_elec*100);
    
    fprintf('Electronic componets Industry \n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Electronic componets sector = ', loss_elec);
    %disp(loss_elec);
    %fprintf('Accuracy value of Electronic componets sector = ', accuracy_elec);
    %disp(accuracy_elec);
    
    x_elec = [1 2 3 4];
    pbv_elec = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_elec = polyfit(x_elec,pbv_elec,1);
    Mpbv_elec = Ppbv_elec(1:1);
    roa_elec = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_elec = polyfit(x_elec,roa_elec,1);
    Mroa_elec = Proa_elec(1:1);
    Mtotal_elec = [Mpbv_elec,Mroa_elec];
    
    P_elec = predict(Mdlelec,Mtotal_elec);
    fprintf('Result of Predicted for Electronic componets : ', P_elec);
    disp(P_elec);
    if P_elec == 0
        disp('Recommend to Hold Stock');
    elseif P_elec == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end
    
    gscatter(elecX(:,6),elecX(:,12),elecY(:,1));
    hold on
    gscatter(Mpbv_elec,Mroa_elec,P_elec,'k','x')
    xlabel('mP/BV')
    ylabel('mROA')
    title('Electronic componets')
    
elseif sector == 5
    energyX = xlsread('C:\Users\asus10\Desktop\sectorTrain\energy\energy_data.csv');
    energyY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\energy_train_pbv.csv');
    
    energydata = energyX( : ,[6 12]);
    Mdlenergy = fitcknn(energydata,energyY,'NumNeighbors',3);
    rloss_energy = resubLoss(Mdlenergy);
    energy_cvmodel = crossval(Mdlenergy);
    loss_energy = kfoldLoss(energy_cvmodel);
    accuracy_energy = 100.00-(rloss_energy*100);
    
    fprintf('Energy and Utilities Industry \n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Energy and Utilities sector = ', loss_energy);
    %disp(loss_energy);
    %fprintf('Accuracy value of Energy and Utilities sector = ', accuracy_energy);
    %disp(accuracy_energy);
    
    x_energy = [1 2 3 4];
    pbv_energy = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_energy = polyfit(x_energy,pbv_energy,1);
    Mpbv_energy = Ppbv_energy(1:1);
    roa_energy = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_energy = polyfit(x_energy,roa_energy,1);
    Mroa_energy = Proa_energy(1:1);
    Mtotal_energy = [Mpbv_energy,Mroa_energy];
    
    P_energy = predict(Mdlenergy,Mtotal_energy);
    fprintf('Result of Predicted for Energy and Utilities : ', P_energy);
    disp(P_energy);
    if P_energy == 0
        disp('Recommend to Hold Stock');
    elseif P_energy == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end
    
    gscatter(energyX(:,6),energyX(:,12),energyY(:,1));
    hold on
    gscatter(Mpbv_energy,Mroa_energy,P_energy,'k','x')
    xlabel('mP/BV')
    ylabel('mROA')
    title('Energy and Utilities')

elseif sector == 6
    foodX = xlsread('C:\Users\asus10\Desktop\sectorTrain\food\food_data.csv');
    foodY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\food_train_pbv.csv');
    
    fooddata = foodX( : ,[6 12]);
    Mdlfood = fitcknn(fooddata,foodY,'NumNeighbors',3);
    rloss_food = resubLoss(Mdlfood);
    food_cvmodel = crossval(Mdlfood);
    loss_food = kfoldLoss(food_cvmodel);
    accuracy_food = 100.00-(rloss_food*100);
    
    fprintf('Food and Beverage Industry\n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Food and Beverages sector = ', loss_food);
    %disp(loss_food);
    %fprintf('Accuracy value of Food and Beverage sector = ', accuracy_food);
    %disp(accuracy_food);
    
    x_food = [1 2 3 4];
    pbv_food = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_food = polyfit(x_food,pbv_food,1);
    Mpbv_food = Ppbv_food(1:1);
    roa_food = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_food = polyfit(x_food,roa_food,1);
    Mroa_food = Proa_food(1:1);
    Mtotal_food = [Mpbv_food,Mroa_food];
    
    P_food = predict(Mdlfood,Mtotal_food);
    fprintf('Result of Predicted for Food and Beverage : ', P_food);
    disp(P_food);
    if P_food == 0
        disp('Recommend to Hold Stock');
    elseif P_food == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end
    
    gscatter(foodX(:,6),foodX(:,12),foodY(:,1));
    hold on
    gscatter(Mpbv_food,Mroa_food,P_food,'k','x')
    xlabel('mP/BV')
    ylabel('mROA')
    title('Food and Beverage')
    
elseif sector == 7
    matX = xlsread('C:\Users\asus10\Desktop\sectorTrain\mat\scc_data.csv');
    matY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\mat_train_pbv.csv');

    matdata = matX( : ,[6 12]);
    Mdlmat = fitcknn(matdata,matY,'NumNeighbors',3);
    rloss_mat = resubLoss(Mdlmat);
    mat_cvmodel = crossval(Mdlmat);
    loss_mat = kfoldLoss(mat_cvmodel);
    accuracy_mat = 100.00-(rloss_mat*100);
    
    fprintf('Material Industry\n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Material sector = ', loss_mat);
    %disp(loss_mat);
    %fprintf('Accuracy value of Material sector = ', accuracy_mat);
    %disp(accuracy_mat);
    
    x_mat = [1 2 3 4];
    pbv_mat = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_mat = polyfit(x_mat,pbv_mat,1);
    Mpbv_mat = Ppbv_mat(1:1);
    roa_mat = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_mat = polyfit(x_mat,roa_mat,1);
    Mroa_mat = Proa_mat(1:1);
    Mtotal_mat = [Mpbv_mat,Mroa_mat];
    
    P_mat = predict(Mdlmat,Mtotal_mat);
    fprintf('Predicted for Material : ', P_mat);
    disp(P_mat);
    if P_mat == 0
        disp('Recommend to Hold Stock');
    elseif P_mat == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end
    
    gscatter(matX(:,6),matX(:,12),matY(:,1));
    hold on
    gscatter(Mpbv_mat,Mroa_mat,P_mat,'k','x')
    xlabel('mP/BV')
    ylabel('mROA')
    title('Material')
    
elseif sector == 8
    petroX = xlsread('C:\Users\asus10\Desktop\sectorTrain\petro\petro_data.csv');
    petroY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\petro_train_pbv.csv');
    
    petrodata = petroX( : ,[6 12]);
    Mdlpetro = fitcknn(petrodata,petroY,'NumNeighbors',7);
    rloss_petro = resubLoss(Mdlpetro);
    petro_cvmodel = crossval(Mdlpetro);
    loss_petro = kfoldLoss(petro_cvmodel);
    accuracy_petro = 100.00-(rloss_petro*100);
    
    fprintf('Petrochemation and Chemicals Industry\n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Petrochemation and Chemicals sector = ', loss_petro);
    %disp(loss_petro);
    %fprintf('Accuracy value of Petrochemation and Chemicals sector = ', accuracy_petro);
    %disp(accuracy_petro);
    
    x_petro = [1 2 3 4];
    pbv_petro = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_petro = polyfit(x_petro,pbv_petro,1);
    Mpbv_petro = Ppbv_petro(1:1);
    roa_petro = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_petro = polyfit(x_petro,roa_petro,1);
    Mroa_petro = Proa_petro(1:1);
    Mtotal_petro = [Mpbv_petro,Mroa_petro];
    
    P_petro = predict(Mdlpetro,Mtotal_petro);
    fprintf('Result of Predicted for Petrochemation and Chemicals : ', P_petro);
    disp(P_petro);
    if P_petro == 0
        disp('Recommend to Hold Stock');
    elseif P_petro == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end
    
    gscatter(petroX(:,6),petroX(:,12),petroY(:,1));
    hold on
    gscatter(Mpbv_petro,Mroa_petro,P_petro,'k','x')
    xlabel('mP/BV')
    ylabel('mROA')
    title('Petrochemation and Chemicals')
    
elseif sector == 9
    proX = xlsread('C:\Users\asus10\Desktop\sectorTrain\property\pro_data.csv');
    proY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\pro_train_pbv.csv');
    
    prodata = proX( : ,[6 12]);
    Mdlpro = fitcknn(prodata,proY,'NumNeighbors',3);
    rloss_pro = resubLoss(Mdlpro);
    pro_cvmodel = crossval(Mdlpro);
    loss_pro = kfoldLoss(pro_cvmodel);
    accuracy_pro = 100.00-(rloss_pro*100);
    
    fprintf('Property Development Industry\n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Property Development sector = ', loss_pro);
    %disp(loss_pro);
    %fprintf('Accuracy value of Property Development sector = ', accuracy_pro);
    %disp(accuracy_pro);
    
    x_pro = [1 2 3 4];
    pbv_pro = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_pro = polyfit(x_pro,pbv_pro,1);
    Mpbv_pro = Ppbv_pro(1:1);
    roa_pro = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_pro = polyfit(x_pro,roa_pro,1);
    Mroa_pro = Proa_pro(1:1);
    Mtotal_pro = [Mpbv_pro,Mroa_pro];
    
    P_pro = predict(Mdlpro,Mtotal_pro);
    fprintf('Result of Predicted for Property Development : ', P_pro);
    disp(P_pro);
    if P_pro == 0
        disp('Recommend to Hold Stock');
    elseif P_pro == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end
    
    gscatter(proX(:,6),proX(:,12),proY(:,1));
    hold on
    gscatter(Mpbv_pro,Mroa_pro,P_pro,'k','x')
    xlabel('mP/BV')
    ylabel('mROA')
    title('Property Development')

elseif sector == 10 
    techX = xlsread('C:\Users\asus10\Desktop\sectorTrain\tech\tech_data.csv');
    techY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\tech_train_pbv.csv');
    
    techdata = techX( : ,[6 12]);
    Mdltech = fitcknn(techdata,techY,'NumNeighbors',3);
    rloss_tech = resubLoss(Mdltech);
    tech_cvmodel = crossval(Mdltech);
    loss_tech = kfoldLoss(tech_cvmodel);
    accuracy_tech = 100.00-(rloss_tech*100);
    
    fprintf('Information Technology Industry\n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Information Technology sector = ', loss_tech);
    %disp(loss_tech);
    %fprintf('Accuracy value of Information Technology sector = ', accuracy_tech);
    %disp(accuracy_tech);
    
    x_tech = [1 2 3 4];
    pbv_tech = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_tech = polyfit(x_tech,pbv_tech,1);
    Mpbv_tech = Ppbv_tech(1:1);
    roa_tech = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_tech = polyfit(x_tech,roa_tech,1);
    Mroa_tech = Proa_tech(1:1);
    Mtotal_tech = [Mpbv_tech,Mroa_tech];
    
    P_tech = predict(Mdltech,Mtotal_tech);
    fprintf('Result of Predicted for Information Technology : ', P_tech);
    disp(P_tech);
    if P_tech == 0
        disp('Recommend to Hold Stock');
    elseif P_tech == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end

    gscatter(techX(:,6),techX(:,12),techY(:,1));
    hold on
    gscatter(Mpbv_tech,Mroa_tech,P_tech,'k','x')
    xlabel('mP/BV')
    ylabel('mROA')
    title('Information Technology')
    
elseif sector == 11
    tranX = xlsread('C:\Users\asus10\Desktop\sectorTrain\tran\tran_data.csv');
    tranY = xlsread('C:\Users\asus10\Desktop\sectorTrain\train\tran_train_pbv.csv');
    
    trandata = tranX( : ,[6 12]);
    Mdltran = fitcknn(trandata,tranY,'NumNeighbors',3);
    rloss_tran = resubLoss(Mdltran);
    tran_cvmodel = crossval(Mdltran);
    loss_tran = kfoldLoss(tran_cvmodel);
    accuracy_tran = 100.00-(rloss_tran*100);
    
    fprintf('Transportation and Logistics Industry\n');
    fprintf('After the Training Data is completed \n');
    %fprintf('Loss value of Transportation and Logistics sector = ', loss_tran);
    %disp(loss_tran);
    %fprintf('Accuracy value of Transportation and Logistics sector = ', accuracy_tran);
    %disp(accuracy_tran);
    
    x_tran = [1 2 3 4];
    pbv_tran = input('Input linear fit of P/BV (M) to calculate for use Test  : ')
    Ppbv_tran = polyfit(x_tran,pbv_tran,1);
    Mpbv_tran = Ppbv_tran(1:1);
    roa_tran = input('Input linear fit of ROA (M) to calculate for use Test  : ')
    Proa_tran = polyfit(x_tran,roa_tran,1);
    Mroa_tran = Proa_tran(1:1);
    Mtotal_tran = [Mpbv_tran,Mroa_tran];
    
    P_tran = predict(Mdltran,Mtotal_tran);
    fprintf('Result of Predicted for Transportation and Logistics : ', P_tran);
    disp(P_tran);
    if P_tran == 0
        disp('Recommend to Hold Stock');
    elseif P_tran == 1
        disp('Recommend to Buy Stock');
    else
        disp('Recommend to Sell Stock');
    end
    
    gscatter(tranX(:,6),tranX(:,12),tranY(:,1));
    hold on
    gscatter(Mpbv_tran,Mroa_tran,P_tran,'k','x')
    xlabel('mP/BV')
    ylabel('mROA')
    title('Transportation and Logistics')
    
else
    disp('none');
    
end