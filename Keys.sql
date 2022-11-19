use game_company;

/*****************************************************/

ALTER TABLE `coupon`
ADD FOREIGN KEY (`id_coupon_type`) REFERENCES `coupon_type`(`id`);

/*****************************************************/

ALTER TABLE `employee`
ADD FOREIGN KEY (`id_user`) REFERENCES `user`(`id`),
ADD FOREIGN KEY (`id_type_employee`) REFERENCES `employee_type`(`id`),
ADD FOREIGN KEY (`id_experience_employee`) REFERENCES `employee_experience`(`id`),
ADD FOREIGN KEY (`id_country_birth`) REFERENCES `country`(`id`);

/*****************************************************/

ALTER TABLE `employee_participated_gamedev`
ADD FOREIGN KEY (`id_game`) REFERENCES `game`(`id`),
ADD FOREIGN KEY (`id_employee`) REFERENCES `employee`(`id`);

/*****************************************************/

ALTER TABLE `employee_salary`
ADD FOREIGN KEY (`id_employee`) REFERENCES `employee`(`id`);

/*****************************************************/

ALTER TABLE `game`
ADD FOREIGN KEY (`id_genre`) REFERENCES `game_genre`(`id`),
ADD FOREIGN KEY (`id_image_cover`) REFERENCES `image`(`id`);


/*****************************************************/

ALTER TABLE `game_platform`
ADD FOREIGN KEY (`id_game`) REFERENCES `game`(`id`),
ADD FOREIGN KEY (`id_platform`) REFERENCES `platform`(`id`),
ADD UNIQUE `unique_index`(`id_game`, `id_platform`);

/*****************************************************/

ALTER TABLE `game_serial`
ADD FOREIGN KEY (`id_game_platform`) REFERENCES `game_platform`(`id`);

/*****************************************************/

ALTER TABLE `image`
ADD FOREIGN KEY (`id_original_image`) REFERENCES `image`(`id`);

/*****************************************************/


ALTER TABLE `transaction`
ADD FOREIGN KEY (`id_user`) REFERENCES `user`(`id`),
ADD FOREIGN KEY (`id_coupon`) REFERENCES `coupon`(`id`),
ADD FOREIGN KEY (`id_serial`) REFERENCES `game_serial`(`id`);

/*****************************************************/

ALTER TABLE `user`
ADD FOREIGN KEY (`id_user_type`) REFERENCES `user_type`(`id`);

/*****************************************************/

ALTER TABLE `user_buyers_deleted`
ADD FOREIGN KEY (`id_user`) REFERENCES `user`(`id`);

/*****************************************************/

ALTER TABLE `user_cart`
ADD FOREIGN KEY (`id_user`) REFERENCES `user`(`id`),
ADD FOREIGN KEY (`id_game_platform`) REFERENCES `game_platform`(`id`);

/*****************************************************/

ALTER TABLE `user_favourite_game`
ADD FOREIGN KEY (`id_user`) REFERENCES `user`(`id`),
ADD FOREIGN KEY (`id_game_platform`) REFERENCES `game_platform`(`id`);
