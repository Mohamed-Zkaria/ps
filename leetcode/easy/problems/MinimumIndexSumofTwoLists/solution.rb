# @param {String[]} list1
# @param {String[]} list2
# @return {String[]}
def find_restaurant(list1, list2)
    result = []
    strings = {}
    min = nil
    list1.each_with_index do |str, idx|
        if strings[str]
            strings[str] << idx
        else
            strings[str] = [idx]
        end
    end
    list2.each_with_index do |str, idx|
        if strings[str]
            strings[str] << idx
        else
            strings[str] = [idx]
        end
    end

    strings.keys.each do |key|
        if strings[key].length > 1
            min = strings[key].sum if min.nil?
            if strings[key].sum < min
                min = strings[key].sum
            end
        end
    end

    strings.keys.each do |key|
        if strings[key].length > 1
            result << key if strings[key].sum == min
        end
    end
    result
end






list1 = ["Shogun","Tapioca Express","Burger King","KFC"]
list2 = ["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"]

find_restaurant(list1, list2)



list1 = ["Shogun","Tapioca Express","Burger King","KFC"]
list2 = ["KFC","Shogun","Burger King"]

find_restaurant(list1, list2)


list1 = ["happy","sad","good"]
list2 = ["sad","happy","good"]

find_restaurant(list1, list2)