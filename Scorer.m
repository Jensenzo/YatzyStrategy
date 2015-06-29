classdef Scorer  < handle
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    %     1. Ones: The sum of all dice showing the number 1.
    %     2. Twos: The sum of all dice showing the number 2.
    %     3. Threes: The sum of all dice showing the number 3.
    %     4. Fours: The sum of all dice showing the number 4.
    %     5. Fives: The sum of all dice showing the number 5.
    %     6. Sixes: The sum of all dice showing the number 6.
    %     If a player manages to score at least 63 points (an average of three of each number) in the upper section, they are awarded a bonus of 50 points.
    % 
    %     Lower Section:
    % 
    %     7. One Pair: Two dice showing the same number. Score: Sum of those two dice.
    %     8. Two Pairs: Two different pairs of dice. Score: Sum of dice in those two pairs.
    %     9. Three of a Kind: Three dice showing the same number. Score: Sum of those three dice.
    %     10.Four of a Kind: Four dice with the same number. Score: Sum of those four dice.
    %     11.Small Straight: The combination 1-2-3-4-5. Score: 15 points (sum of all the dice).
    %     12.Large Straight: The combination 2-3-4-5-6. Score: 20 points (sum of all the dice).
    %     13.Full House: Any set of three combined with a different pair. Score: Sum of all the dice.
    %     14.Chance: Any combination of dice. Score: Sum of all the dice.
    %     15.Yatzy: All five dice with the same number. Score: 50 points.
    
    properties
        sheet;
    end
    
    methods
        %constructor
        function obj = Scorer()
            obj.sheet = NaN(1,15);
        end 
        
        function ret = setValue(obj, key, data)
           if isnan(obj.sheet(key))
               obj.sheet(key) = data;
               ret = 1;
           else
               ret = -1;
           end
        end
        
        function total = getTotal(obj)
            
            if sum(isnan(obj.sheet)) == 0
                total = sum(obj.sheet(~isnan(obj.sheet)));
                
                if getTopSum() >= 63
                    total = total + 50;
                end
                
            else
                total = -1;
            end
            
        end
        
        function sumtop = getTopSum(obj)
            sumtop = sum(obj.sheet(~isnan(obj.sheet(1:6))));
        end
        
        function left = getLeft(obj)
            left = sum(isnan(obj.sheet));
        end
            
        function out = getValue(obj, key)
            out = obj.sheet(key);
        end
        
    end        
    
end

