# encoding: utf-8
class PreencheZonasSecoesGoiania < ActiveRecord::Migration
  def up
    Endereco.create(:cep => "74800000", :complemento => "Goiânia", :municipio_id => 1008)
  	@ei = Endereco.find(:first, :conditions => "cep = '74800000' and complemento = 'Goiania'")
    limite_eleitores = 200

  	z = Zona.create(:id => 1, :descricao => "Zona 001", :endereco => @ei) unless Zona.find_by_id(1)
  		[100, 101, 102, 271, 291, 48, 149, 150, 151, 152, 153, 154, 155, 156, 157, 251, 258, 270, 276, 280, 306, 313, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 246, 265, 273, 279, 284, 315,	14, 15, 16, 17, 18, 46, 47, 70, 71, 86, 253, 285, 299, 304, 160, 161, 162, 163, 164, 263, 325, 80, 81, 82, 83, 84, 85, 90, 91, 158, 159, 310, 321, 33, 34, 35, 36, 37, 63, 64, 68, 69, 72, 73, 74, 75, 282, 300, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 61, 62, 65, 66, 92, 252, 261, 266, 26, 238, 239, 240, 241, 242,38, 39, 40, 41, 42, 43, 44, 45, 275, 307, 312, 48, 49, 50, 51, 52, 292,	121, 123, 124, 125, 126, 137, 138, 139, 140, 143, 144, 145, 146, 147, 257, 262, 267, 268, 274, 278, 286, 296, 328, 243, 244, 245, 264, 277, 308, 318,	122, 141, 142, 250, 254, 259, 281, 293, 314, 326, 329, 330, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 248, 294, 295, 311, 316, 317, 322, 55, 56, 57, 58, 59, 60, 289, 298, 301, 53, 54, 67, 76, 77, 78, 79,	103, 104, 105, 107, 108, 109, 110, 249, 309, 323, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 256, 260, 272, 87, 88, 89, 320, 288, 290, 302, 327, 93, 94, 95, 96, 97, 98, 99, 106, 247, 255, 283, 287, 297, 303, 305, 319, 30, 31, 32, 33, 34, 348, 349, 350, 351, 352, 353,	51, 52, 121, 122, 123].each do |numero_secao|
  			Secao.create(:codigo => numero_secao, :zona_id => z.id, :limite_eleitores => limite_eleitores) unless Secao.find(:first, :conditions => ["codigo = ? and zona_id = ?", numero_secao, z.id])
  		end
  	z = Zona.create(:id => 2, :descricao => "Zona 002", :endereco => @ei) unless Zona.find_by_id(2)
  		[44, 45, 46, 47, 456, 336, 337, 338, 446, 451, 457, 471, 479, 487, 491, 499, 507, 511, 515, 521, 11, 12, 444, 28, 29, 354, 355, 356, 386, 394, 413, 441, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 358, 367, 387, 405, 416, 434, 417, 422, 445, 454, 459, 467, 469, 481, 492, 497, 503, 505,509, 513, 516, 5, 6, 7, 8, 9, 10, 363, 428, 464, 50, 418, 421, 439, 449, 453, 458, 465, 473, 482,	504, 506, 510, 512, 514, 517, 520, 22, 23, 24, 25, 26, 27, 114, 115, 116, 423, 450, 455, 478, 489, 496, 191, 192, 330, 331, 332, 333, 334, 380, 400, 419, 435, 447, 463, 474, 498, 373, 396, 425, 476, 518, 153, 245, 246, 335, 365, 381, 436, 494, 214, 391, 404, 426, 37, 38, 39, 40, 41, 399, 424, 48, 49, 50, 79, 80, 81, 82, 83, 345, 346, 347, 488, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 366, 382, 97, 98, 99, 100, 101, 102, 103, 431, 368, 372, 393, 412, 448, 477, 502, 135, 136, 137, 359, 430, 277, 278, 279, 280, 379, 427, 138, 139, 140, 141, 440, 483, 142, 143, 144, 145, 146, 166, 167, 168, 169, 170, 360, 433, 171, 172, 173, 174, 383, 466, 472, 175, 176, 177, 178, 179, 180, 181, 370, 375, 389, 395, 401, 407, 495, 193, 194, 195, 196, 390, 437, 35, 36, 429, 484, 197, 198, 199, 200, 201, 202, 54, 55, 56, 57, 58, 371, 376, 388, 398, 402, 406, 411, 219, 220, 221, 222, 223, 374, 377, 384, 392, 397, 408, 420, 462, 438, 452, 461, 470, 480, 485, 486, 493,	281, 282, 283, 284, 362, 415, 369, 385, 403, 414, 442, 460, 475, 490, 500, 508, 519, 285, 286, 287, 288, 289, 290, 291, 233, 324, 325, 326, 42, 43, 308, 309, 310, 327, 328, 329, 361, 378, 432, 339, 340, 341, 342, 343, 344].each do |numero_secao|
  			Secao.create(:codigo => numero_secao, :zona_id => z.id, :limite_eleitores => limite_eleitores) unless Secao.find(:first, :conditions => ["codigo = ? and zona_id = ?", numero_secao, z.id])
  		end
  	z = Zona.create(:id => 126, :descricao => "Zona 126", :endereco => @ei) unless Zona.find_by_id(126)
  		[173, 174, 175, 176, 341, 348, 349, 354, 359, 364, 368, 372, 249, 250, 251, 252, 253, 254, 255, 256, 300, 230, 231, 339, 352, 243, 244, 245, 50, 51, 52, 53, 54, 55, 319, 333, 337, 344, 351, 355, 358, 361, 363, 366, 367, 369, 150, 151, 152, 153, 154, 155, 156, 157, 317, 332, 336, 345, 246, 247, 248, 357, 160, 161, 162, 163, 226, 227, 228, 229, 257, 258, 259, 260, 261, 262, 263, 270, 335, 264, 265, 266, 267, 268, 269, 340, 356, 158, 159, 164, 165, 166, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 296, 347, 365, 371, 167, 168, 169, 170, 171, 172, 308, 322, 334, 338, 346, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 342, 360, 194, 195, 343, 350, 353, 362, 370, 373].each do |numero_secao|
  			Secao.create(:codigo => numero_secao, :zona_id => z.id, :limite_eleitores => limite_eleitores) unless Secao.find(:first, :conditions => ["codigo = ? and zona_id = ?", numero_secao, z.id])
  		end
  	z = Zona.create(:id => 127, :descricao => "Zona 127", :endereco => @ei) unless Zona.find_by_id(127)
  		[2, 250, 379, 399, 100, 101, 102, 103, 350, 396, 378, 400, 169, 170, 171, 172, 173, 230, 241, 242, 256, 258, 262, 267, 270, 286, 288, 292, 295, 326, 330, 338, 339, 342, 344, 332, 337, 348, 362, 375, 388, 364, 373, 376, 382, 391, 397, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 60, 61, 220, 287, 298, 8, 9, 10, 11, 12, 13, 276, 297, 319, 374, 229, 238, 254, 260, 269, 291, 308, 324, 17, 18, 19, 20, 226, 235, 251, 255, 263, 274, 289, 299, 323, 5, 6, 7, 243, 266, 290, 309, 328, 200, 201, 202, 224, 237, 245, 259, 264, 272, 294, 303, 317, 377, 386, 394, 403, 331, 336, 347, 353, 361, 371, 380, 401, 63, 64, 65, 66, 67, 239, 273, 302, 154, 155, 156, 157, 158, 159, 227, 234, 248, 261, 275, 89, 90, 91, 92, 93, 94, 95, 96, 97, 233, 247, 280, 293, 304, 88, 231, 307, 334, 346, 367, 389, 360, 365, 393, 99, 174, 175, 271, 318, 345, 359, 110, 111, 112, 113, 114, 115, 116, 117, 118, 160, 161, 162, 163, 164, 249, 282, 310, 176, 177, 178, 322, 369, 196, 197, 198, 199, 223, 252, 268, 306, 351, 285, 356, 363, 392, 203, 204, 205, 257, 321, 366, 381, 402, 355, 357, 385, 62, 86, 87, 165, 166, 167, 168, 236, 277, 314, 329, 14, 15, 16, 253, 283, 38, 39, 40, 41, 42, 278, 301, 312, 333, 335, 349, 390, 218, 219, 240, 265, 296, 325, 341, 358, 387, 98, 244, 343, 368, 395, 71, 145, 146, 147, 148, 222, 246, 279, 284, 315, 327, 352, 372, 384, 398, 1, 221, 225, 232, 281, 300, 305, 311, 313, 316, 320, 340, 354, 370, 383].each do |numero_secao|
  			Secao.create(:codigo => numero_secao, :zona_id => z.id, :limite_eleitores => limite_eleitores) unless Secao.find(:first, :conditions => ["codigo = ? and zona_id = ?", numero_secao, z.id])
  		end
  	z = Zona.create(:id => 133, :descricao => "Zona 133", :endereco => @ei) unless Zona.find_by_id(133)
			[216, 223, 237, 248, 255, 259, 173, 181, 192, 64, 65, 66, 67, 68, 69, 105, 144, 95, 96, 97, 98, 99, 100, 157, 240, 253, 113, 116, 123, 129, 138, 146, 211, 217, 91, 92, 93, 94, 107, 126, 172, 175, 87, 88, 89, 90, 109, 122, 197, 228, 111, 121, 130, 148, 159, 166, 185, 194, 203, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 79, 80, 81, 82, 83, 106, 165, 70, 71, 101, 190, 209, 247, 39, 40, 41, 42, 43, 44, 45, 118, 57, 119, 180, 183, 205, 213, 220, 224, 117, 125, 133, 142, 153, 164, 186, 218, 72, 73, 189, 219, 242, 51, 52, 53, 54, 55, 56, 210, 227, 239, 84, 85, 86, 178, 115, 171, 196, 30, 31, 32, 33, 34, 140, 177, 13, 14, 15, 16, 17, 18, 19, 20, 103, 156, 21, 22, 23, 24, 25, 26, 27, 28, 104, 124, 137, 147, 74, 75, 76, 77, 78, 114, 120, 127, 145, 170, 199, 35, 36, 37, 38, 108, 132, 154, 193, 112, 136, 152, 160, 169, 187, 204, 212, 225, 241, 58, 59, 60, 61, 62, 63, 102, 135, 155, 226, 174, 208, 221, 238, 245, 250, 254, 257, 258, 151, 158, 162, 168, 176, 200, 110, 128, 161, 134, 143, 150, 163, 191, 29, 49, 50, 141, 184, 195, 243, 244, 46, 47, 48, 188, 198, 206, 235, 236, 246, 249, 251, 256, 179, 201, 207, 214, 139, 215, 202, 222, 131, 149, 167, 182, 252].each do |numero_secao|
  			Secao.create(:codigo => numero_secao, :zona_id => z.id, :limite_eleitores => limite_eleitores) unless Secao.find(:first, :conditions => ["codigo = ? and zona_id = ?", numero_secao, z.id])
  		end
  	z = Zona.create(:id => 134, :descricao => "Zona 134", :endereco => @ei) unless Zona.find_by_id(134)
			[213, 241, 260, 287, 288, 289, 290, 291, 37, 38, 39, 40, 41, 95, 96, 97, 98, 220, 248, 279, 292, 300, 309, 320, 42, 43, 44, 45, 46, 186, 255, 274, 282, 306, 310, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 169, 215, 247, 284, 301, 34, 35, 36, 205, 271, 278, 296, 303, 317, 319, 80, 81, 82, 83, 84, 85, 170, 293, 294, 295, 298, 308, 315, 68, 69, 70, 71, 87, 209, 244, 285, 304, 312, 318, 47, 48, 49, 50, 240, 272, 280, 299, 307, 311, 321, 62, 63, 64, 65, 66, 67, 283, 302, 72, 73, 74, 75, 76, 77, 78, 79, 86, 88, 276, 89, 90, 91, 92, 93, 94, 286, 316, 109, 110, 111, 112, 113, 114, 168, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 258, 100, 101, 102, 103, 104, 105, 106, 107, 108, 190, 273, 314, 125, 126, 127, 128, 129, 210, 234, 162, 163, 164, 165, 166, 167, 200, 211, 218, 245, 261, 275, 277, 281, 305, 313, 322].each do |numero_secao|
  			Secao.create(:codigo => numero_secao, :zona_id => z.id, :limite_eleitores => limite_eleitores) unless Secao.find(:first, :conditions => ["codigo = ? and zona_id = ?", numero_secao, z.id])
  		end
  	z = Zona.create(:id => 135, :descricao => "Zona 135", :endereco => @ei) unless Zona.find_by_id(135)
  		[16, 17, 18, 19, 20, 193, 276, 309, 296, 303, 314, 318, 320, 126, 136, 149, 160, 176, 183, 191, 04, 300, 315, 321, 328, 335, 338, 341, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 109, 55, 56, 57, 58, 59, 60, 208, 227, 231, 251, 258, 280, 327, 332, 9, 10, 11, 254, 83, 84, 85, 86, 87, 138, 268, 294, 47, 48, 49, 50, 51, 52, 53, 54, 108, 174, 266, 285, 76, 77, 78, 79, 80, 137, 150, 171, 179, 186, 201, 246, 291, 302, 308, 317, 330, 121, 139, 154, 172, 187, 204, 244, 281, 21, 22, 23, 24, 25, 26, 27, 169, 184, 194, 223, 252, 270, 284, 292, 242, 282, 298, 312, 323, 339, 31, 32, 33, 34, 35, 36, 167, 185, 197, 274, 28, 29, 30, 188, 228, 81, 82, 289, 293, 295, 326, 12, 13, 14, 15, 269, 304, 61, 62, 63, 64, 65, 66, 67, 68, 110, 145, 168, 272, 94, 95, 96, 97, 98, 99, 100, 101, 113, 271, 1, 2, 116, 143, 159, 181, 199, 229, 88, 89, 90, 91, 92, 175, 192, 255, 288, 299, 313, 102, 103, 104, 105, 106, 107, 331, 342, 324, 325, 334, 337, 340, 345, 263, 283, 290, 297, 307, 247, 287, 306, 319, 333, 343, 260, 286, 301, 311, 316, 322, 329, 336, 344, 6, 7, 8, 166, 230, 273, 310, 3, 305].each do |numero_secao|
  			Secao.create(:codigo => numero_secao, :zona_id => z.id, :limite_eleitores => limite_eleitores) unless Secao.find(:first, :conditions => ["codigo = ? and zona_id = ?", numero_secao, z.id])
  		end
  	z = Zona.create(:id => 136, :descricao => "Zona 136", :endereco => @ei) unless Zona.find_by_id(136)
  		[17, 18, 19, 138, 185, 242, 290, 318, 3, 4, 5, 6, 7, 8, 239, 306, 20, 21, 22, 23, 24, 25, 253, 300, 368, 168, 213, 223, 286, 358, 431, 481, 126, 136, 149, 241, 278, 296, 316, 334, 348, 365, 104, 116, 134, 164, 201, 226, 272, 299, 343, 16, 112, 118, 123, 137, 147, 161, 222, 240, 266, 282, 297, 309, 385, 417, 440, 456, 470, 485, 488, 169, 182, 191, 204, 217, 234, 262, 277, 292,303, 319, 337, 359, 380, 397, 418, 430, 442, 453, 459, 29, 30, 31, 32, 33, 34, 207, 230, 260, 287, 312, 342, 374, 420, 478, 257, 269, 270, 280, 317, 340, 363, 408, 437, 462, 289, 310, 333, 346, 367, 389, 416, 441, 466, 483, 206, 256, 281, 330, 369, 404, 446, 474, 491, 1, 2, 9, 10, 11, 12, 13, 14, 15, 122, 150, 165, 324, 354, 105, 106, 107, 108, 111, 177, 228, 291, 352, 395, 429, 447, 128, 135, 148, 166, 180, 192, 218, 243, 274, 379, 413, 490, 476, 492, 97, 98, 99, 100, 101, 102, 103, 151, 176, 188, 202, 210, 220, 232, 258, 273, 284, 295, 304, 321, 341, 360, 376, 26, 27, 28, 357, 421, 450, 113, 121, 130, 141, 159, 178, 200, 215, 231, 265, 125, 144, 167, 193, 209, 236, 279, 362, 461, 38, 39, 143, 246, 335, 426, 35, 36, 37, 40, 41, 42, 117, 120, 131, 145, 162, 187, 235, 285, 320, 377, 412, 124, 140, 175, 194, 225, 259, 114, 129, 142, 160, 179, 199, 216, 248, 275, 294, 302, 314, 323, 349, 237, 328, 382, 384, 414, 451, 43, 44, 45, 46, 47, 48, 110, 198, 249, 339, 460, 469, 480, 399, 419, 432, 457, 484, 493, 186, 211, 255, 293, 315, 332, 347, 372, 390, 401, 77, 78, 79, 158, 252, 373, 424, 452, 75, 76, 133, 181, 247, 443, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 264, 454, 69, 70, 71, 72, 73, 74, 163, 251, 80, 81, 82, 83, 84, 85, 378, 428, 464, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 109, 449, 465, 477, 325, 366, 388, 405, 425, 445, 171, 184, 189, 196, 203, 212, 221, 227, 250, 115, 127, 139, 146, 174, 195, 350, 173, 219, 326, 406, 479, 208, 233, 267, 298, 336, 371, 394, 415, 407, 409, 427, 444, 458, 467, 482, 489, 386, 400, 403, 423, 433, 448, 468, 486, 473, 183, 197, 229, 261, 307, 351, 396, 455, 353, 370, 393, 398, 475, 172, 214, 268, 313, 345, 375, 392, 411, 364, 391, 422, 434, 435, 436, 439, 472, 238, 263, 271, 288, 305, 322, 338, 344, 356, 361, 387, 410, 170, 190, 205, 224, 244, 276, 301, 331, 355, 383, 402, 438, 463, 487, 254, 327, 471, 62, 63, 64, 65, 66, 67, 68, 119, 132, 157, 245, 283, 311, 381, 308, 329].each do |numero_secao|
  			Secao.create(:codigo => numero_secao, :zona_id => z.id, :limite_eleitores => limite_eleitores) unless Secao.find(:first, :conditions => ["codigo = ? and zona_id = ?", numero_secao, z.id])
  		end
  	z = Zona.create(:id => 146, :descricao => "Zona 146", :endereco => @ei) unless Zona.find_by_id(146)
			[196, 202, 209, 215, 218, 229, 232, 238, 242, 246, 250, 253, 259, 194, 210, 235, 257, 116, 117, 134, 147, 163, 176, 186, 203, 207, 213, 224, 225, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 145, 148, 92, 93, 94, 95, 96, 130, 41, 42, 43, 44, 45, 46, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 126, 129, 236, 240, 244, 248, 251, 255, 261, 169, 180, 190, 201, 164, 174, 179, 184, 188, 198, 205, 212, 228, 239, 256, 160, 182, 200, 214, 216, 231, 241, 102, 103, 104, 127, 159, 199, 226, 237, 140, 170, 187, 206, 227, 54, 55, 56, 57, 89, 90, 91, 137, 81, 82, 83, 84, 85, 86, 87, 88, 153, 165, 181, 204, 220, 245, 74, 75, 76, 77, 78, 79, 80, 211, 142, 149, 158, 166, 173, 183, 8, 9, 10, 11, 12, 13, 14, 125, 47, 48, 49, 50, 51, 52, 53, 118, 119, 143, 156, 70, 71, 72, 73, 121, 1, 2, 3, 4, 5, 6, 7, 155, 171, 61, 62, 63, 64, 65, 66, 67, 68, 69, 105, 106, 124, 131, 141, 150, 59, 60, 135, 151, 175, 110, 111, 112, 113, 114, 115, 123, 128, 133, 139, 136, 144, 154, 167, 189, 221, 107, 108, 109, 122, 138, 146, 152, 162, 197, 223, 233, 247, 254, 168, 177, 191, 217, 249, 120, 193, 222, 260, 195, 208, 219, 230, 234, 243, 252, 258, 161, 172, 178, 185, 192, 97, 98, 99, 100, 101, 157].each do |numero_secao|
  			Secao.create(:codigo => numero_secao, :zona_id => z.id, :limite_eleitores => limite_eleitores) unless Secao.find(:first, :conditions => ["codigo = ? and zona_id = ?", numero_secao, z.id])
  		end
  	z = Zona.create(:id => 147, :descricao => "Zona 147", :endereco => @ei) unless Zona.find_by_id(147)
  		[431, 440, 443, 337, 357, 362, 392, 413, 437, 454, 254, 291, 325, 370, 397, 414, 439, 255, 301, 324, 344, 365, 378, 391, 401, 415, 420, 436, 444, 448, 332, 334, 338, 360, 374, 405, 434, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 219, 230, 249, 266, 256, 335, 358, 359, 384, 252, 310, 354, 363, 409, 429, 449, 253, 298, 318, 329, 385, 389, 398, 406, 142, 175, 205, 231, 271, 299, 316, 336, 369, 387, 399, 416, 432, 445, 450, 201, 269, 286, 303, 319, 345, 375, 412, 452, 380, 382, 394, 411, 418, 141, 156, 184, 215, 250, 292, 347, 372, 390, 410, 424, 447, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 233, 265, 88, 89, 90, 91, 92, 93, 94, 95, 11, 12, 13, 14, 15, 16, 209, 241, 280, 307, 350, 376, 402, 425, 17, 18, 19, 20, 21, 22, 23, 24, 237, 273, 312, 355, 361, 78, 79, 80, 81, 82, 116, 117, 155, 173, 188, 195, 210, 224, 239, 243, 257, 272, 284, 74, 75, 76, 77, 212, 248, 278, 302, 317, 83, 84, 146, 162, 174, 183, 208, 242, 289, 313, 85, 86, 87, 164, 211, 274, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 262, 283, 119, 120, 149, 170, 186, 203, 236, 356, 403, 441, 99, 100, 101, 147, 153, 166, 181, 197, 198, 207, 229, 352, 118, 144, 159, 187, 204, 222, 235, 258, 442, 455, 132, 133, 134, 135, 136, 160, 194, 228, 268, 285, 294, 200, 227, 251, 287, 305, 327, 367, 393, 430, 214, 259, 293, 328, 340, 381, 395, 315, 331, 386, 400, 427, 106, 107, 108, 154, 168, 190, 199, 216, 96, 97, 98, 152, 182, 217, 261, 308, 423, 456, 111, 112, 179, 232, 279, 309, 349, 366, 422, 446, 167, 202, 247, 288, 311, 351, 364, 172, 263, 326, 137, 138, 150, 161, 169, 176, 185, 191, 264, 290, 139, 140, 145, 151, 163, 171, 223, 275, 330, 320, 343, 377, 404, 419, 438, 453, 321, 322, 339, 342, 408, 433, 451, 54, 55, 56, 57, 58, 59, 60, 61, 238, 270, 314, 333, 373, 388, 407, 426, 109, 110, 180, 220, 244, 276, 306, 348, 421, 428, 30, 31, 32, 33, 34, 35, 36, 37, 38, 113, 148, 165, 178, 192, 206, 221, 225, 234, 260, 281, 296, 25, 26, 27, 28, 29, 435, 114, 115, 143, 157, 177, 189, 196, 213, 226, 246, 277, 297, 346, 371, 379, 383, 417, 457, 282, 300, 304, 323, 341, 353, 396, 102, 103, 104, 105, 193, 240, 368, 39, 40, 41, 42, 43, 44, 245, 295, 45, 46, 47, 48, 49, 50, 51, 52, 53, 158, 218, 26].each do |numero_secao|
  			Secao.create(:codigo => numero_secao, :zona_id => z.id, :limite_eleitores => limite_eleitores) unless Secao.find(:first, :conditions => ["codigo = ? and zona_id = ?", numero_secao, z.id])
  		end
  end

  def down
  	Secao.delete_all
    Zona.delete_all
  end
end
