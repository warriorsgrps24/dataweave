 /*%dw 2.0
 output application/json  
---
 payload reduce ((item, accumulator = {}) -> item mapObject ((value, key, index) -> if (isEmpty(value) or !isEmpty(accumulator[key]))
       {}
    else
      accumulator ++ {
         (key): value
       }))
*/

%dw 2.0
output application/json
---
(payload map((item, index)-> item filterObject ((value, key, index) -> value != "")) reduce($$ ++ $)) distinctBy ((value, key) -> key) 

