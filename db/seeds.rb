seed_waffles = [
  [3.5, 'Suchy'],
  [4, 'Z cukrem pudrem'],
  [5, 'Z polewą'],
  [5.5, 'Z polewą i cukrem pudrem'],
  [6, 'Z owocami'],
  [6, 'Ze śmietaną'],
  [6.5, 'Z owocami i cukrem pudrem'],
  [6.5, 'Ze śmietaną i cukrem pudrem'],
  [7.5, 'Ze śmietaną i polewą'],
  [8.5, 'Ze śmietaną i owocami'],
  [9, 'Ze śmietaną, owocami i cukrem pudrem'],
  [10, 'Ze śmietaną, owocami i polewą']
]

seed_waffles.each do |price, name|
  Waffle.create( name: name, price: price )
end