maxSpeed=10;
initSpeed=2;
car=[];
speed=[];
carFig=[];


for(i=1:800)
    car=[car 0];
    speed=[speed 0];
end

for(i=1:800)
    
    for(j=800:-1:1)
        if car(j)==1
            
            slowDownDice=randsample(1:10,1);
            if (slowDownDice<4)
                        speed(j)=initSpeed;
            end
            vibMaxSpeed=maxSpeed+randsample(0:3,1);
            if speed(j)<vibMaxSpeed
                if j<800-2    
                    if (car(j+1)==0&&car(j+2)==0)
                        speed(j)=speed(j)+1;
                    end
                end
            end
            
                newPos=j+speed(j);
                if(newPos<=800)
                    for k=j+1:newPos
                        if(car(k)==1)
                            newPos=k-1;
                            break;
                        end
                    end
                end
            
                    
                
            car(newPos)=1;
            speed(newPos)=speed(j);
            car(j)=0;
            speed(j)=0;
            
        end
        car=car(1:800);
        speed=speed(1:800);
        
                
        
    end
    carFig=[carFig;car];

    
    
    newCarDice=randsample(1:10,1);
    if (newCarDice<8)&&(car(1)==0)
        car(1)=1;
        speed(1)=initSpeed;
    end
    
    
end
a=imshow([1-carFig])
pause
for(i=1:800)
    imshow([1-carFig(i,:)]);
    pause(0.005)
end
