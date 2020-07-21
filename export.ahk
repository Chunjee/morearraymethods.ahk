; ``````````````````
; Start Custom Array
; ``````````````````
Array(Elements*) {
	Elements.Base := CustomBase
	return Elements
}

class CustomBase {
	indexOf(param_query) {
		for k, v in this {
			if (v = param_query) {
				return k
			}
		}
		return -1
	}

	join(param_sepatator := ",") {
		for l_key, l_value in this {
			if (A_Index == 1) {
				l_string := "" l_value
				continue
			}
			l_string := l_string param_sepatator l_array[A_Index]
		}
		return l_string
	}

	shift() {
		if (this.Count() == 0) {
			return ""
		}
		for l_key, l_value in this {
			l_output := l_value
			this.RemoveAt(l_key)
			return l_output
		}
	}

	unshift(param_elements*) {
		for l_key, l_value in param_elements {
			; unshift plain values
			if (!IsObject(l_value)) {
				this.InsertAt(1, param_element)
			} else { 
				;push an entire array
				this.InsertAt(1, param_element*)
			}
		this.InsertAt(1, param_element)
	}

	
}
; ``````````````````
; End Custom Array
; ``````````````````