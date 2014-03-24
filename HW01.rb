class String
        def smear(k1)
               
               # Let's count how many characters are missing
               left = Math.sqrt(self.length).ceil * Math.sqrt(self.length).ceil - self.length
               #puts "\nLeftiin utga = #{left}"
               
               # Then we need to update our input with "*"'s
               updtdInput = (self.scan(/./) + ["*"] * left).join
               #puts "\nupdtdInput utga = #{updtdInput}"
               
               # find number of rows/cols such that block is almost square (but longer than taller)
               numcols = Math.sqrt(updtdInput.length).ceil
               #puts "\nnumcols utga = #{numcols}"
               
               # break plain text into even blocks with numcols size
               rows = updtdInput.scan(/.{#{numcols}}/)
               #puts "\nrows utga = #{rows}"
               
               # sort rows in predictably random way with given seed
               myrand = Random.new(k1)
               #puts "\nmyrand -d 0-s k1 hurtelhi toog olgoj bui utga = #{myrand}"
            
               #za end netees olson yumaa heregjuulev           
               
               #rows = rows.map { |rows| [myrand.rand, rows]}
               
               #puts "\n\nrows = #{rows}"
               #puts "\nrows utgiig random numbertai ni list-tei list bolgoj bna = #{rows}\n"

               rows.sort_by!{myrand.rand }
               puts "rows after first seed = #{rows}"

               #puts "\n****rows utga random-g deerhi ugugdluur randomloj sort_by hiisen utga = #{rows}\n"   

               #puts "\nrows-iin utga = #{rows}"

               #rows = Hash[*rows.flatten]
               #puts "\n Hash руу хөрвүүлж үзэв #{rows}"
               
               #rows = rows.values
               #puts "\n hash болгож хөрвүүлсний дараах утга = #{rows}"
               
               myrand = Random.new(k1+5) 

               #rows.map{|row| row.chars{|x| puts x, myrand.rand}}
               
               rows = rows.map {|row| row.chars.sort_by{ myrand.rand }.join}.join
               #puts "\n\n ******* #{rows}"

               
               # sort columns in random way with given seed, then find the *'s position in rows         
               
               #rows = rows.map { |rows| [myrand.rand, rows]}
               #puts "rows-iin utga 2 dahi K-iin daraa = #{rows}"
               
               #rows = rows.flatten.map { |x| [myrand.rand, x] }
               #puts "\n\nmap hiiv = #{rows}"
               #rows.map {|row| row.characters.sort_by!{myrand.rand}}
               #puts "********* #{rows}  *********"



               #myrand = Random.new(k2)
               #rows = rows.each_slice(numcols).to_a
               #puts "\n\nslicedsenii daraa = #{rows}"
               
               #rows = rows.map {|x| [myrand.rand,x]}
               #puts "\n\nsortlohoos umnu! #{rows}"
               #rows.sort_by!{myrand.rand}
               #puts "\n\nsortlov = #{rows}"

               #rows = Hash[*rows.flatten]
               #rows = rows.values.join
               #puts "hashruu horvuuleed values-iig tuuv = #{rows}"
               #rows = rows.delete("*")
               
               #puts "\nMash chuhal = #{rows}"  
               #rows.map! { |a,b| [a,b.join] } 
               #puts "\nzee Hash-ruu horvuulehed belen! = #{rows}"
               #myrand = Random.new(k2)
               #rows.sort_by!{myrand.rand }
               #puts "CHUHAL! = #{rows}"
               #rows = Hash[*rows.flatten]
               #puts "\n Hash руу хөрвүүлж үзэв #{rows}"
               #rows = rows.values
               #puts "Hash-n value utguudiig rows-t uguv = #{rows}"
               #puts "\n hash bolgochood values-iig ni tuuv #{rows}"
               
            
               #.join missing after .rand.}.
               #rows.join.delete("*")


               #puts "k2-iin daraah myrand = #{myrand}"
               #rows.sort_by!{myrand.rand }
               #puts "k2-oor sort_by hiisnii darah rows = #{rows}"
               #rows = Hash[*rows.flatten]
               #puts "rows array-iig hash bolgov = #{rows}"
               #rows = rows.values
               #puts "hash rows-s utguudiig ni tuuv = #{rows}"
               #rows.map!{|row| row.chars.sort_by{ myrand.rand }}.flatten   
               #puts "k2-oor chars hiigeed daraa ni sort hiigeed map hiigeed flatten hiisnii daraa = #{rows}"
               
               #rows.map!{|row| row.join}.join.delete("*")
               #puts "\nrows map hiigeed joing hiigeed *-g ustgasnii daraah ur dun = #{rows}"
               
        end

        def unsmear(k1)      
            # Let's count how many characters are missing, generate a new plain text as temp
            left = Math.sqrt(self.length).ceil * Math.sqrt(self.length).ceil - self.length
            array = []
            originalTxt = [] 
            counter = -1
            numcols = Math.sqrt(self.length).ceil
            ran = self.split(//)
            #puts "#{ran}"
            #ran = ran.scan(/.{#{numcols}}/)
            #puts "#{ran}"
            myrand = Random.new(k1+5)
            
            ran.each {|row| row.chars{ array.push(myrand.rand) }}
            #puts "array 's value #{array}"
            
            array1 = array.each_slice(numcols).to_a
            array1.map! {|row| row.sort}
            array1.flatten!
            #array2 = array1.map {|row| row.each.sort}
            #puts "\n\narray1 's value #{array1}"
            #puts "\n\narray2 's value #{array2}"
            
            hash = Hash[array1.flatten.map.with_index.to_a]
            #puts "\n\nhash is = #{hash}"
            array.each {|x| originalTxt[counter+=1] = ran[hash[x]]}
            puts "originalTxt = #{originalTxt}"            
            #puts "originalTxt = #{originalTxt}"


            myrand = Random.new(k1)

            array = []
            originalTxt = originalTxt.join
            puts "originalTxt = #{originalTxt}"
            counter = -1


            rows = originalTxt.scan(/.{#{numcols}}/)
            puts "rows = #{rows}"
            rows.each {|row| array.push(myrand.rand)}
            puts "array = #{array}"
            array2 = array.sort
            puts "array2 = #{array2}"
            hash = Hash[array2.map.with_index.to_a]

            puts "hash = #{hash}"

            array.each{|x| array[counter+=1] = rows[hash[x]] }
            #puts "array = #{array}"
            array.join



            #puts "hashruu horvuuleed values-iig tuuv = #{rows}"
            #rows = rows.delete("*")
            #left = Math.sqrt(self.length).ceil * Math.sqrt(self.length).ceil - self.length
            #temp = (self.scan(/./) + ["*"] * left).flatten.join
            
            #break plain text into matrix
            #numcols = Math.sqrt(temp.length).ceil
            #tmpr = temp.scan(/.{#{numcols}}/)

            # sort rows in predictably random way with given seed
            #myrand = Random.new(k2)
            #tmpr.sort_by!{myrand.rand }

            # saving 1st seed's value in to array called ran1
            #myrand = Random.new(k1)
            #ran1= Array.new(tmpr.size){myrand.rand }

            # sort columns in random way with given seed,     
            #myrand = Random.new(k2)              
            #arr = tmpr.map!{|row| row.chars.sort_by{ myrand.rand }}.flatten

            # saving 2nd seed's value in to array called ran2
            #myrand = Random.new(k2)
            #ran2= Array.new(numcols){myrand.rand }

            #now we find the *'s position in rows, saved it into array arr     
            #starp = (0..arr.size-1).select { |i| arr[i] == "*"} 

            #according to each element's value in array, insert * into the Cyphertext, called orig
            #orig =self.split(//)        
            #starp.each{|x| orig.insert(x,"*").join}         

            #break Cyphertext into even blocks
            #rows = orig.join.scan(/.{#{numcols}}/)


        end
end
