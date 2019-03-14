module ChargesHelper
   def who_pays
      [
         ['Care recipient', 'Care recipient'],
         ['Family members', 'Family members'],
         ['Long-term care insurance', 'Long-term care insurance'],         
         ['Medicaid', 'Medicaid'],
         ['Medicare', 'Medicare'],
         ['Veteran\'s affairs', 'Veteran\'s affairs'],
         ['Other (please specify)', 'Other (please specify)']    
      ]
   end
end
