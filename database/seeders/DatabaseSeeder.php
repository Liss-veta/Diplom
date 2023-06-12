<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\About;
use App\Models\About_gallery;
use App\Models\Contact;
use App\Models\Master;
use App\Models\Master_tags;
use App\Models\Post;
use App\Models\Post_image;
use App\Models\Slider_1;
use App\Models\Sovet;
use App\Models\Sovet_image;
use App\Models\Tags;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        // SEEDS FOR USER AUTH!!!
        User::factory()->create([
            'name' => 'Ангелина',
            'email' => 'user@mail.ru',
            'password' => Hash::make('user1111'),
            'role' => 'user']);
        User::factory()->create([
            'name' => 'Артём',
            'email' => 'admin@mail.ru',
            'password' => Hash::make('admin111'),
            'role' => 'admin']);
        User::factory()->create([
            'name' => 'Татьяна',
            'email' => 'master@mail.ru',
            'password' => Hash::make('master11'),
            'role' => 'master']);
        User::factory()->create([
            'name' => 'Августина',
            'email' => 'master1@mail.ru',
            'password' => Hash::make('master11'),
            'role' => 'master']);
        User::factory()->create([
            'name' => 'Мария',
            'email' => 'master2@mail.ru',
            'password' => Hash::make('master11'),
            'role' => 'master']);
        User::factory()->create([
            'name' => 'Ирина',
            'email' => 'master3@mail.ru',
            'password' => Hash::make('master11'),
            'role' => 'master']);

        // SEEDS FOR MASTER
        Master::factory()->create([
            'id_user' => '3',
            'name' => 'Татьяна',
            'surname' => 'Ким',
            'age' => '24',
            'city' => 'Ахтубинск',
            'staj' => '5',
            'clients_count' => '1000',
            'min_cena' => '1200',
            'description' => 'Привет 😊. Меня зовут Татьяна, я визажист и стилист по прическам 🥰. И если ты доверишься мне, то я создам для тебя нечто большее, чем просто образ на вечер! Подчеркну твою индивидуальность на 1000%. Раскрою твою женственность и чувственность! ГАРАНТИРУЮ - ты будешь блистать!!⭐️',
            'avatar' => 'https://i.pinimg.com/474x/da/d9/ef/dad9ef9cf8601037f68ed2c23efd0fe0.jpg',
            'admin_status' => 'active', ]);
        Master::factory()->create([
            'id_user' => '4',
            'name' => 'Августина',
            'surname' => 'Валиева',
            'age' => '29',
            'city' => 'Москва',
            'staj' => '8',
            'clients_count' => '2500',
            'min_cena' => '1800',
            'description' => 'Визажист создает красивый образ с помощью макияжа. Он знает все о косметике и правилах ее нанесения, умеет определять цветотип и особенности строения лица, делать уместный макияж в зависимости от события и запроса клиента. Вооружившись кистью, визажист, словно художник, пишет новый образ человека, подчеркивает наиболее выразительные черты его лица и маскирует существующие недостатки.',
            'avatar' => 'https://i.pinimg.com/474x/f4/80/b9/f480b9a5364f4b6147761b3f74f0998a.jpg',
            'admin_status' => 'active',]);
        Master::factory()->create([
            'id_user' => '5',
            'name' => 'Мария',
            'surname' => 'Макарова',
            'age' => '19',
            'city' => 'Калининград',
            'staj' => '1',
            'clients_count' => '100',
            'min_cena' => '800',
            'description' => 'В профессии визажист мне нравится дарить радость. Чаще всего это достаточно благодарная сфера: очень приятно видеть, когда женщина нравится сама себе: глаза сияют, прибавляется уверенность.
            Главное в профессии – это, конечно, умения и навыки, в том числе умение слушать. Тут, как и при выполнении любой услуги, важно выявить все потребности и, по возможности, удовлетворить их: уточнить тип и состояние кожи, тематику мероприятия, учесть цветовую гамму и стиль одежды, аксессуаров, личные предпочтения, симпатии и антипатии; затем собрать все вместе и сделать работу красиво, продумывая все шаги и тщательно подбирая все косметические средства заранее, ведь не все дают в итоге одинаковый эффект. ',
            'avatar' => 'https://i.pinimg.com/474x/26/d2/3b/26d23b2fcc225da0f54244f29da01df5.jpg',
            'admin_status' => 'active',]);
        Master::factory()->create([
            'id_user' => '6',
            'name' => 'Ирина',
            'surname' => 'Фомина',
            'age' => '23',
            'city' => 'Орёл',
            'staj' => '2',
            'clients_count' => '500',
            'min_cena' => '1000',
            'description' => 'Визажист, следуя моде и мировым тенденциям косметических брендов, в то же время должен учитывать пожелания клиента и его физические особенности: строение лица, форму глаз, бровей и губ, цвет кожи, его стиль и образ жизни. Визажист в ходе консультации может предложить клиенту своё видение образа, но не навязывать его.
            В обязанности визажиста входит не только стилистический макияж, но и подбор подходящих косметологических средств для устранения видимых дефектов кожи.',
            'avatar' => 'https://i.pinimg.com/474x/8d/aa/17/8daa175c69807dbc8d6b9b68c9709bd2.jpg',
            'admin_status' => 'undefined',
        ]);

        // SEEDS FOR TAGS
        Tags::factory()->create(['tag_name' => 'Дневной']);
        Tags::factory()->create(['tag_name' => 'Вечерний']);
        Tags::factory()->create(['tag_name' => 'Свадебный']);
        Tags::factory()->create(['tag_name' => 'Студийный']);
        Tags::factory()->create(['tag_name' => 'Естественный']);

        Master_tags::factory()->create(['id_master'=>'1', 'id_tag' => '1']);
        Master_tags::factory()->create(['id_master'=>'1', 'id_tag' => '3']);
        Master_tags::factory()->create(['id_master'=>'1', 'id_tag' => '5']);
        Master_tags::factory()->create(['id_master'=>'2', 'id_tag' => '2']);
        Master_tags::factory()->create(['id_master'=>'2', 'id_tag' => '4']);
        Master_tags::factory()->create(['id_master'=>'3', 'id_tag' => '2']);
        Master_tags::factory()->create(['id_master'=>'3', 'id_tag' => '3']);
        Master_tags::factory()->create(['id_master'=>'3', 'id_tag' => '4']);
        Master_tags::factory()->create(['id_master'=>'4', 'id_tag' => '1']);
        Master_tags::factory()->create(['id_master'=>'4', 'id_tag' => '2']);
        Master_tags::factory()->create(['id_master'=>'4', 'id_tag' => '3']);
        Master_tags::factory()->create(['id_master'=>'4', 'id_tag' => '4']);
        Master_tags::factory()->create(['id_master'=>'4', 'id_tag' => '5']);

        // SEEDS FOR ABOUT
        About::factory()->create([
            'image' => '\assets\admin\about\image 18.png',
            'description' => 'Профессия визажиста в индустрии красоты с каждым годом набирает популярность. И это не удивительно, ведь создание неповторимого макияжа и стильных образов — целое искусство, подвластное далеко не всем. И дело не только в таланте, который, несомненно, играет важную роль, но и в большом объеме знаний и практических навыков, доступных только настоящим профессионалам. Однако важно помнить, что визажист — это настолько же творческая профессия, насколько и техническая. Ведь мастер должен детально разбираться в косметических средствах и их составах, колористике, техниках макияжа, в том числе базы под макияж, и т.д. Кроме того, тенденции в индустрии красоты меняются с невероятной скоростью. А это обязывает специалистов постоянно совершенствовать навыки, получать новые знания и опыт11.'
        ]);
        About_gallery::factory()->create(['image' => 'assets\admin\about\gallery\5def34a8471329bfa3b3adcb3ab1f990.jpg']);
        About_gallery::factory()->create(['image' => 'assets\admin\about\gallery\6bfac16f808b663e1953769180e7ed4cghfh.jpg']);
        About_gallery::factory()->create(['image' => 'assets\admin\about\gallery\95030c9aaed57a1259cf9bb0c61f74b2.jpg']);
        About_gallery::factory()->create(['image' => 'assets\admin\about\gallery\d9c943f2e3b119a562170bbcd3326586gfd.jpg']);
        About_gallery::factory()->create(['image' => 'assets\admin\about\gallery\e6f7127a246d07b005e7a8e98c2a72a5.jpg']);
        About_gallery::factory()->create(['image' => 'assets\admin\about\gallery\e991fa13253b3fae8d2164a6ccc8263e.jpg']);
        About_gallery::factory()->create(['image' => 'assets\admin\about\gallery\image 10.png']);

        // SEEDS FOR SLIDER
        Slider_1::factory()->create(['number' => '1', 'image' => 'assets\admin\slider\fIw998bexwl9IDMBWFCfpP0WkIEepvVx42wIuzE3.jpg']);
        Slider_1::factory()->create(['number' => '2', 'image' => 'assets\admin\slider\mQxq0GO18234Xp1FgVonnFLjy3Rw9K4M4aXZoIUJ.jpg']);
        Slider_1::factory()->create(['number' => '3', 'image' => 'assets\admin\slider\vMHah9X5rQWRJOGP1viwvj71biKFsvnYIvA9h1Wc.jpg']);

        // SEEDS FOR POSTS
        Post::factory()->create(['id_master' => '1', 'description' => 'Главное совершенствоваться в своем деле. Приятно и полезно будет как и мастеру так и его клиентам.']);
        Post_image::factory()->create(['id_post'=>'1', 'image' => '\assets\posts_img\5o3M9Qb2QW5kopZ6LifNLvo7ESehdwqVUuItvClX.jpg']);

        Post::factory()->create(['id_master' => '1', 'description' => 'Спасибо Анастасии за доверие и уделенное время. С помощью совместных усилий получился нереальный образ.']);
        Post_image::factory()->create(['id_post'=>'2', 'image' => '\assets\posts_img\Rpg9TIo6S5iWA0VMOL4NCvZkHReSGAUaZsgwGJrr.jpg']);

        Post::factory()->create(['id_master' => '2', 'description' => 'Работа визажиста заключается в изучении клиента. Важно понять его желания и настроение, оценить весь образ и грамотно дополнить его. Добавив к этому профессионализм макияжа, можно добиться идеального результата.']);
        Post_image::factory()->create(['id_post'=>'3', 'image' => '\assets\posts_img\FMoUoXBP3caxlGg4q72sO93O3KXkym61bTCc1UFX.jpg']);

        Post::factory()->create(['id_master' => '3', 'description' => 'Набираю опыт и разиваю профессиональные навыки с любимыми клиентами.']);
        Post_image::factory()->create(['id_post'=>'4', 'image' => '\assets\posts_img\hWXH2m5bvc415HMjxHhrj2XJfKhenke7yMSs6RFb.jpg']);

        Post::factory()->create(['id_master' => '3', 'description' => 'Шаг за шагом, вперед к мечте. Мои работы становятся все лучше.']);
        Post_image::factory()->create(['id_post'=>'5', 'image' => '\assets\posts_img\e8H41aVB4UAt0scpbno1gDhECdkjnrFy58VN8pIs.jpg']);

        // SEEDS FOR CONTACTS
        Contact::factory()->create(['title'=>'Позвоните нам','description'=>'Есть вопросы? Мы поможем','contact'=>'8(906)-457-03-40']);
        Contact::factory()->create(['title'=>'Напишите нам','description'=>'Мы открыты для любых вопросов','contact'=>'admin@mail.ru']);
        Contact::factory()->create(['title'=>'Хочешь стать частью команды?','description'=>'Заполняй заявку и присоединяйся','contact'=>'Оставляйте заявку']);

        // SEEDS FOR SOVETS
        Sovet::factory()->create([
            'id_master' => '1', 
            'description' => 'Главное совершенствоваться в своем деле. Приятно и полезно будет как и мастеру так и его клиентам.',
            'privilege'=>'0']);
        Sovet_image::factory()->create(['id_sovet'=>'1', 'image' => '\assets\sovets_img\GUjQmu3qCbb0bMatFhQVhM70yNVpHh0BrsTEpTDV.jpg']);

        Sovet::factory()->create([
            'id_master' => '1', 
            'description' => 'Спасибо Анастасии за доверие и уделенное время. С помощью совместных усилий получился нереальный образ.',
            'privilege'=>'2']);
        Sovet_image::factory()->create(['id_sovet'=>'2', 'image' => '\assets\sovets_img\HCV5k5m5NfJSbStWoV2yGb6o59L8oEzVSSSbBPL5.jpg']);
        Sovet_image::factory()->create(['id_sovet'=>'2', 'image' => '\assets\sovets_img\iuhdT8m2jwgQ53ZPUie4KPid3TI5GVUHcJaGbmEr.jpg']);

        Sovet::factory()->create([
            'id_master' => '2', 'description' => 'Работа визажиста заключается в изучении клиента. Важно понять его желания и настроение, оценить весь образ и грамотно дополнить его. 
            Добавив к этому профессионализм макияжа, можно добиться идеального результата.',
            'privilege'=>'1']);
        Sovet_image::factory()->create(['id_sovet'=>'3', 'image' => '\assets\sovets_img\jdqR3aNWAToQm2E4U7iDZPcGpuM4PEBOPZNiBLZx.jpg']);
        Sovet_image::factory()->create(['id_sovet'=>'3', 'image' => '\assets\sovets_img\knv0NJevjPlYcsHMCmWhnKkzvtX6NpvEloJeQS01.jpg']);
        Sovet_image::factory()->create(['id_sovet'=>'3', 'image' => '\assets\sovets_img\NJKQZVClZCtyCJyO99Abd7YPoBngbtO4CWfoZh3e.jpg']);

        Sovet::factory()->create([
            'id_master' => '3', 
            'description' => 'Набираю опыт и разиваю профессиональные навыки с любимыми клиентами.',
            'privilege'=>'1']);
        Sovet_image::factory()->create(['id_sovet'=>'4', 'image' => '\assets\sovets_img\poG97aT0hNC1NZ3W1h4FpXfM4w9ylHaK3FYJE374.jpg']);
        Sovet_image::factory()->create(['id_sovet'=>'4', 'image' => '\assets\sovets_img\YlrYcjoxkfStvUd7JGaBTHtlQTlj88f3cz8o3IRC.jpg']);

    }
}
