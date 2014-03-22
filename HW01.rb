class String
        def smear(k1, k2)
               
               # Let's count how many characters are missing
               left = Math.sqrt(self.length).ceil * Math.sqrt(self.length).ceil - self.length
               
               # Then we need to update our input with "*"'s
               updtdInput = (self.scan(/./) + ["*"] * left).flatten.join
               
               # find number of rows/cols such that block is almost square (but longer than taller)
               numcols = Math.sqrt(updtdInput.length).ceil

               # break plain text into even blocks
               rows = updtdInput.scan(/.{#{numcols}}/)

               # sort rows in predictably random way with given seed
               myrand = Random.new(k1)
               rows.sort_by!{myrand.rand }
                 
               # sort columns in random way with given seed, then find the *'s position in rows         
               myrand = Random.new(k2)
               arr = rows.map!{|row| row.chars.sort_by{ myrand.rand }}.flatten   

               rows.map!{|row| row.join}.join.delete("*")
        end

        def unsmear(k1,k2)      
            # Let's count how many characters are missing, generate a new plain text as temp
            left = Math.sqrt(self.length).ceil * Math.sqrt(self.length).ceil - self.length
            temp = (self.scan(/./) + ["*"] * left).flatten.join
            
            #break plain text into matrix
            numcols = Math.sqrt(temp.length).ceil
            tmpr = temp.scan(/.{#{numcols}}/)

            # sort rows in predictably random way with given seed
            myrand = Random.new(k1)
            tmpr.sort_by!{myrand.rand }

            # saving 1st seed's value in to array called ran1
            myrand = Random.new(k1)
            ran1= Array.new(tmpr.size){myrand.rand }

            # sort columns in random way with given seed,     
            myrand = Random.new(k2)              
            arr = tmpr.map!{|row| row.chars.sort_by{ myrand.rand }}.flatten

            # saving 2nd seed's value in to array called ran2
            myrand = Random.new(k2)
            ran2= Array.new(numcols){myrand.rand }

            #now we find the *'s position in rows, saved it into array arr     
            starp = (0..arr.size-1).select { |i| arr[i] == "*"} 

            #according to each element's value in array, insert * into the Cyphertext, called orig
            orig =self.split(//)        
            starp.each{|x| orig.insert(x,"*").join}         

            #break Cyphertext into even blocks
            rows = orig.join.scan(/.{#{numcols}}/)


            test edit 


        end
end
