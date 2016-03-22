#!/usr/bin/ruby -w

class MergeSort

    def TopDownMergeSort
        input = Array.new
        a = Array.new
        b = Array.new
        ParseInput(input, a)
        a.each_with_index do |num, i|
            b[i] = 0
        end        
        
        TopDownSplitMerge(a, 0, a.length, b)
        
        print(a)
    end

    def TopDownSplitMerge(a, iBegin, iEnd, b)
        puts "iBegin: #{iBegin}"
        puts "iEnd: #{iEnd}"
        if ((iEnd - iBegin) < 2)
            return
        end

        iMiddle = ((iEnd + iBegin) / 2)             #Middle index of the array

        puts "calling split left"
        puts "a: #{a}"
        puts "b: #{b}"
        TopDownSplitMerge(a, iBegin, iMiddle, b)    #Split / merge left half

        puts "calling split right"
        puts "a: #{a}"
        puts "b: #{b}"
        TopDownSplitMerge(a, iMiddle, iEnd, b)      #Split / merge right half

        puts "calling merge 2 halves"
        puts "a: #{a}"
        puts "b: #{b}"
        TopDownMerge(a, iBegin, iMiddle, iEnd, b)   #Merge the two halves

        puts "calling copy"
        puts "a: #{a}"
        puts "b: #{b}"
        CopyArray(b, iBegin, iEnd, a)               #Copy merged sub-arrays back to A

    end

    def TopDownMerge(a, iBegin, iMiddle, iEnd, b)
        i = iBegin
        j = iMiddle
        puts "in TopDownMerge"
        puts "iBegin: #{iBegin}"
        puts "iMiddle: #{iMiddle}"
        puts "iEnd: #{iEnd}"

        #While there are elements in the left or right runs
        for k in iBegin..iEnd-1 #NOT SURE IF INCLUSIVE OR NOT
            puts "k = #{k}"
            if (i < iMiddle and (j >= iEnd or a[i] <= a[j]))
                b[k] = a[i]
                i+=1
            else
                b[k] = a[j]
                j+=1
            end
        end
    end

    def CopyArray(b, iBegin, iEnd, a)
        for k in iBegin..iEnd-1
            a[k] = b[k]
        end
    end 

    def ParseInput(a, b)
        input = $<.read
        a = (input.gsub(/\s+/m, ' ').strip.split(" "))
        a.each_with_index do |num, i|
            b[i] = (Integer(num))
        end
    end
end

#Main
c = MergeSort.new
c.TopDownMergeSort()





