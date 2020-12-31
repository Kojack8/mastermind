require_relative './../compare_answer'

# ALlowing rubocop to autocorrect this page results in a break
class KnuthComparison
  def run_comparison(org_comparison, guess, knu_arr)
    comp_arr = []
    knu_arr.each { |x|
      compare_answer = CompareAnswer.new(x, guess)
      compared = compare_answer.run_comparison
      if compared == org_comparison
        comp_arr << true
      else
        comp_arr << false
      end
    }
    comp_arr
  end

  def remove_comparisons(knu_arr, comparison_arr)
    counter = 0
    comparison_arr.each { |x| 
      if x == false
        knu_arr.slice!(counter)
        counter -= 1
      end
    counter += 1
    }
    knu_arr
  end

  def default_possibilities
    comp_possibilities = {
      [2, 2, 2, 2] => 0, [2, 2, 2, 0] => 0, [2, 2, 0, 0] => 0, 
      [2, 0, 0, 0] => 0, [0, 0, 0, 0] => 0, [2, 2, 1, 1] => 0,
      [2, 2, 1, 0] => 0, [2, 1, 1, 0] => 0, [2, 1, 0, 0] => 0,
      [1, 1, 0, 0] => 0, [1, 0, 0, 0] => 0, [1, 1, 1, 1] => 0, 
      [1, 1, 1, 0] => 0, [2, 1, 1, 1] => 0
      }

  end

  def calc_possibilities(comparison, poss_arr)
    
    poss_arr.each { |k, v| 
      if k == comparison
        poss_arr[k] += 1
      end
  
    }
    
    return poss_arr



  end
end