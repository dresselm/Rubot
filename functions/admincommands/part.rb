def part
	send_data("PART #{@channel} #{@user_name_first} made me do it");
end
