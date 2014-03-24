# Adds a smear and unsmear function to the Ruby's String class
class String
	def smear()
		# find number of rows/cols such that block is almost square (but longer than taller)
		numcols = Math.sqrt(self.length).ceil

		# break plaintext into even blocks
		rows = self.scan(/.{#{numcols}}/)
		puts "rows end yag yaaj huvaagdaad bgaan? = #{rows}"
		# sort rows in predictibly random way with given seed
		myrand = Random.new(128)
		rows.sort_by!{ myrand.rand }
		puts "rowsiin utga 128iin daraa = #{rows}"
		# sort columns of each row in predictibly random way with given seed
		# return joined cyphertext
		myrand = Random.new(129)
		rows.map!{|row| row.chars.sort_by{ myrand.rand }.join}.join
	end

	def unsmear()
		# TODO: FILL THIS IN!
	end
end