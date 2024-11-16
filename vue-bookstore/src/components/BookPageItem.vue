<script setup>
import Header from './Header.vue'

defineProps({
  code: Number,
  title: String,
  author: String,
  imageUrl: String,
  price: Number,

  publishing: String,
  series: String,
  translator: String,
  illustrator: String,
  cover: String,
  pageCont: String,
  year: String,
  ISBN: String,
  section: String,
  size: String,
  weight: String,
  description: String,

  isFavorite: Boolean,
  isAdded: Boolean,
  onClickAdd: Function,
  onClickFaivorite: Function
})
</script>

<template>

    <div class="flex flex-col px-20 py-12">
      <div class="flex flex-col gap-4 mb-4">
        <h2 class="text-3xl font-bold">{{ title }}</h2>
        <a class="text-gray-600 border-b border-gray-200 w-fit hover:text-red-400 transition"
        href="#">Анджей Сапковский</a>
      </div>

      <div class="flex gap-20">
        <div class="flex items-top gap-12 mt-2">
           <img src="C:\Users\Kekma\Desktop\diploma\vue-bookstore\public\booksPage\book-1.jpg" alt="Cover"
           class="w-96">
           <div class="flex flex-col gap-2">
              <p class="font-medium">Аннотация</p>
              <p class="text-ellipsis overflow-hidden h-36">Он уничтожает чудовищ и выручает попавших в беду… как правило, за деньги.
              Он виртуозно владеет мечом… и никогда не помышлял о военной карьере.
              Он защищает людей… которые его презирают, ненавидят и боятся.
              Он странствующий рыцарь… без шпор, девиза, замка и прекрасной дамы.
              А впрочем, прекрасная дама обязательно будет. А еще будут чары и тайны,
              неразделенная любовь и нелегкий выбор, схватки не на жизнь, а на смерть, странствия,
              песни и, конечно, сказки — знакомые всем с детства и разительно отличные от того,
              к чему мы привыкли.
              Сага А. Сапковского давно занимает почетное место в мировой традиции жанра фэнтези,
              а Геральт стал культовым персонажем не только в мире литературы, но и в универсуме
              компьютерных игр. Первая книга из цикла «Ведьмак» впервые выходит с иллюстрациями
              Дениса Гордеева, созданными специально для этого издания.</p>
              <button class="bg-gray-100 hover:bg-gray-200 focus:outline-none rounded-lg px-4 py-2
              w-fit mt-4">
                Перейти к описанию
              </button>

              <div class="flex gap-10 mt-8">
                <div class="flex flex-col gap-3 text-gray-400">
                  <p>Серия</p>
                  <p>Издательство</p>
                  <p>Переплет</p>
                  <p>Страниц</p>
                  <p>Год, тираж</p>
                </div>
                <div class="flex flex-col gap-3">
                  <p>Сапковский с иллюстрациями</p>
                  <p>АСТ</p>
                  <p>Твёрдый переплёт</p>
                  <p>320</p>
                  <p>2022</p>
                </div>
              </div>
              <a class="mt-4 hover:text-red-400 transition" href="#">Перейти к характеристикам ></a>
           </div>
        </div>

        <div class="flex flex-col gap-4 shadow-lg rounded-lg w-fit h-fit p-12">
          <div class="flex justify-between">
            <h2 class="text-2xl font-bold">1 154 ₽</h2>
            <img src="C:\Users\Kekma\Desktop\diploma\vue-bookstore\public\plus.svg" alt="Plus">
          </div>
          <button class="text-white bg-red-400 hover:bg-red-500 text-xl
            focus:outline-none font-medium rounded-lg px-8 py-2">
            Оформить
          </button>
        </div>
      </div>

      <div class="text-2xl font-medium my-10">
        Отзывы
      </div>

      <div class="flex flex-col gap-4">
        <div class="text-2xl font-medium">
          Описание и характеристики
        </div>
        <p class="w-3/5">Он уничтожает чудовищ и выручает попавших в беду… как правило, за деньги.
              Он виртуозно владеет мечом… и никогда не помышлял о военной карьере.
              Он защищает людей… которые его презирают, ненавидят и боятся.
              Он странствующий рыцарь… без шпор, девиза, замка и прекрасной дамы.
              А впрочем, прекрасная дама обязательно будет. А еще будут чары и тайны,
              неразделенная любовь и нелегкий выбор, схватки не на жизнь, а на смерть, странствия,
              песни и, конечно, сказки — знакомые всем с детства и разительно отличные от того,
              к чему мы привыкли.
              <br>Сага А. Сапковского давно занимает почетное место в мировой традиции жанра фэнтези,
              а Геральт стал культовым персонажем не только в мире литературы, но и в универсуме
              компьютерных игр. Первая книга из цикла «Ведьмак» впервые выходит с иллюстрациями
              Дениса Гордеева, созданными специально для этого издания.</p>

        <div class="flex gap-16 mt-8">
          <div class="flex flex-col gap-3 text-gray-400">
            <p>Код</p>
            <p>Издательство</p>
            <p>Серия</p>
            <p>Автор</p>
            <p>Переводчик</p>
            <p>Переплет</p>
            <p>Кол-во страниц</p>
            <p>Год издания</p>
            <p>ISBN</p>
            <p>Раздел</p>
            <p>Размеры</p>
            <p>Вес</p>
          </div>
          <div class="flex flex-col gap-3">
            <p>2577371</p>
            <p>АСТ</p>
            <p>Сапковский с иллюстрациями</p>
            <p>Анджей Сапковский</p>
            <p>Вайсброт Евгений Павлович</p>
            <p>Твёрдый переплёт</p>
            <p>320</p>
            <p>2022</p>
            <p>978-5-17-102028-6</p>
            <p>Зарубежное фэнтези</p>
            <p>16.8 см × 24.2 см</p>
            <p>0.63 кг</p>
          </div>
        </div>
      </div>

    </div>
</template>
