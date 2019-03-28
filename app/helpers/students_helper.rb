module StudentsHelper
    def check_selected(value1, value2)
        if value1 == value2
            return "selected='selected'"
        end
    end
end
