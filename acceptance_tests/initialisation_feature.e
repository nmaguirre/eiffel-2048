note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	INITIALISATION_FEATURE

inherit
	EQA_TEST_SET

feature -- Test routines

	initialisation_feature
			-- Scenario: Default game start
            --    When I run the application (without parameters)
            --    Then I should see the game board with only two, randomly picked, filled cells,
            --            with values 2 or 4.
		local
			controller: CONTROLLER_2048
			i, j: INTEGER
		do
			-- When I run the application (without parameters)
			create controller.make
			-- Then I should see the game board with only two filled cells, with values 2 or 4.
			assert ("only two filled cells", controller.board.nr_of_filled_cells = 2)
			from
				i:=1
			until
				i=5
			loop
				from
					j:=1
				until
					j=5
				loop
					assert ("valid initial value", controller.board.elements[i,j].value=0 or
						controller.board.elements[i,j].value=2 or
						controller.board.elements[i,j].value=4 )
						j := j+1
				end
				i := i+1
			end

		end

end
