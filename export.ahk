; ``````````````````
; Start Custom Array
; ``````````````````
Array(Elements*) {
	Elements.Base := CustomBase
	return Elements
}
Object(Elements*) {
	Elements.Base := CustomBase
	return Elements
}


class CustomBase {
	includes(param_valueToFind, param_fromIndex := 1) {
		for l_key, l_value in this {
			if (l_key < param_fromIndex) {
				continue
			}
			if (l_value = param_valueToFind) {
				return true
			}
		}
		return false
	}

	indexOf(param_query) {
		for l_key, l_value in this {
			if (l_value = param_query) {
				return l_key
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
			l_string := l_string param_sepatator l_value
		}
		return l_string
	}

	keys() {
		l_array := []
		for l_key, l_value in this {
			l_array.push(l_key)
		}
		return l_array
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
		if (IsObject(param_elements)) {
			while (param_elements.Count() != 0) {
				this.InsertAt(1, param_elements.pop())
			}
		} else {
			; unshift plain values (may need rework because of how ahk handles variadic arguments)
			; if user wants to unshift a plain array, make sure that works
			this.InsertAt(1, param_elements)
		}
		return this.Count()
	}

	reverse() {
		l_array := []
		while (this.Count() != 0) {
			l_array.push(this.pop())
		}
		this := l_array.Clone()
		return l_array
	}

	map(param_callback:="__identity") {
		l_array := []
		for l_key, l_value in this {
			if (IsFunc(param_callback)) {
				l_array.push(param_callback.call(l_value))
				continue
			} else {
				l_array.push(l_value)
			}
		}
		return l_array
	}
}
; ``````````````````
; End Custom Array
; ``````````````````