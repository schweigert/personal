# Divisor de gastos entre N Pessoas

bucket = Hash.new { [] }
total_percapta = Hash.new { [] }
total = 0.0

puts 'pessoas'
gets.split(',').each do |el|
  bucket[el.chomp] = 0.0
  total_percapta[el.chomp] = 0.0
end
n = bucket.size.to_f


bucket.keys.each do |person| 
  puts "entradas da pessoa: #{person}"

  loop {
    puts 'valor: (0 para próxima pessoa)'
    value = gets.chomp.to_f
    break if value == 0.0

    bucket.keys.each do |other|
      bucket[other] = bucket[other] - value / n
    end

    bucket[person] = bucket[person] + value
    total = total + value
    total_percapta[person] = total_percapta[person] + value
  }

  puts 'database:'
  pp bucket
  puts "Total: #{total}"
  pp total_percapta
end
