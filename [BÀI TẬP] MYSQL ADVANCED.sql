-- Câu 1: 5 người sử dụng ứng dụng lâu nhất-- 
SELECT  id , username,DATEDIFF(CURDATE(), created_at) AS day_diff
FROM users
ORDER BY day_diff DESC
LIMIT 5


-- Câu 2: 2 ngày có lượt đăng ký nhiều nhất
SELECT created_at 
FROM users
GROUP BY created_at 
HAVING (COUNT(*)>1) 
ORDER BY created_at ASC


-- Câu 3: Xác định người dùng không hoạt động --
SELECT *
FROM photos 
RIGHT JOIN users ON photos.user_id = users.id 
WHERE user_id is NULL


-- Câu 4: Ảnh nhiều like nhất và người dùng tạo ra --
SELECT *
FROM (SELECT photo_id, COUNT(photo_id) maxLike
FROM likes 
GROUP BY photo_id 
HAVING maxLike = (
SELECT
	MAX(maxLike)
FROM (
	SELECT
		photo_id,
		COUNT(photo_id) AS maxLike
	FROM
		likes 
	GROUP BY
		photo_id) AS tempTables)) AS mostLikeTable
JOIN users ON users.id = mostLikeTable.photo_id



-- Câu 5: Số lượng ảnh trung bình/ users -- 
SELECT
	(SELECT
			COUNT(id) AS SUMuser
		FROM
			users) / (
		SELECT
			
			COUNT(id) AS sumPhoto
		FROM
			photos)  AS avgPhotoUser
			
			
-- Câu 6: 5 Người thường được hastag --
SELECT tag_name,COUNT(*) AS timeTag
FROM
(SELECT tag_name, tag_id
FROM photo_tags 
JOIN tags ON tags.id = photo_tags.tag_id
JOIN photos ON photos.id = photo_tags.photo_id) AS tagTable
GROUP BY tag_name 
ORDER BY timeTag DESC
LIMIT 5			
			
			
-- Câu 7: Những người đã thích 1 bức ảnh
SELECT username
FROM likes  JOIN users ON users.id = likes.user_id
RIGHT JOIN photos ON photos.id = likes.photo_id
WHERE username is NOT NULL
GROUP BY username
