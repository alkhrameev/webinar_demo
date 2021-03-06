import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:webinar_demo/conditional/youtube.dart';
import 'package:webinar_demo/data.dart';
import 'package:webinar_demo/util.dart';
import 'package:webinar_demo/widget/corner_card.dart';
import 'package:webinar_demo/widget/gear_logo.dart';
import 'package:webinar_demo/widget/message_card.dart';
import 'package:webinar_demo/widget/person_card.dart';
import 'package:webinar_demo/widget/primary_btn.dart';
import 'package:webinar_demo/widget/simple_card.dart';
import 'package:webinar_demo/widget/submit_form.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, .5, 1.0],
              colors: [
                ColorRes.backGradientBegin,
                ColorRes.backGradientCenter,
                ColorRes.backGradientEnd,
              ],
            ),
          ),
          child: Scaffold(
            floatingActionButton: _buldFab(context),
            endDrawer: _buildEndDrawer(context),
            backgroundColor: Colors.transparent,
            body: MainScrollProvider(
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: SafeArea(
                        child: GearLogo(
                          height: context.sw600 ? 80.0 : 148.0,
                          width: context.sw600 ? 80.0 : 148.0,
                        ),
                      )),
                  _buildContent(context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEndDrawer(BuildContext context) {
    return Card(
      elevation: 16.0,
      child: Container(
        width: context.sw600 ? 280.0 : 480.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0, .5, 1.0],
            colors: [ColorRes.backGradientBegin, ColorRes.backGradientCenter, ColorRes.backGradientEnd],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: context.sw600 ? 16.0 : 24.0, right: context.sw600 ? 16.0 : 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64.0),
                  child: Text(
                    'Напишите нам',
                    style: context.sp(StyleRes.head36Title),
                  ),
                ),
              ),
              SizedBox(height: 64.0),
              _buildEndDrawerTile(
                context,
                Icon(
                  Icons.email,
                  color: ColorRes.textBlue,
                  size: context.sw600 ? 36.0 : 56.0,
                ),
                'электронная почта'.toUpperCase(),
                () => launch('mailto:<EDUCATION@SURFSTUDIO.RU>'),
              ),
              _buildEndDrawerTile(
                context,
                Icon(
                  Icons.email,
                  color: ColorRes.textBlue,
                  size: context.sw600 ? 36.0 : 56.0,
                ),
                'telegram'.toUpperCase(),
                () => launch('https://t.me/Surf_Flutter_Course_bot'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEndDrawerTile(
    BuildContext context,
    Widget icon,
    String title,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: PrimaryBtn.regular(
        child: Row(
          children: [
            icon,
            Text(title, style: context.sp(StyleRes.content20Blue)),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buldFab(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: context.sw600 ? 60.0 : 100.0,
        maxHeight: context.sw600 ? 60.0 : 100.0,
      ),
      child: SimpleCard(
        child: adaptiveIcon(
          IconRes.message,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Positioned.fill(
      child: Builder(builder: (ctx) {
        return ListView(
          controller: MainScrollProvider.of(ctx).scrollController,
          physics: ClampingScrollPhysics(),
          children: [
            _buildHeader(context),
            SizedBox(height: context.sw600 ? 16.0 : 32.0),
            _buildEnrollBtn(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildBenefits(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildSkills(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildProps(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildVideoQuality(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildLectures(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildEnrollBtn2(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildAfterCourse(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildSert(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildMentors(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildTargets(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildEnrollBtn(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
            _buildForm(context),
            SizedBox(height: context.sw600 ? 64.0 : 96.0),
          ],
        );
      }),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.sw600 ? 64.0 : 96.0),
          Text(
            'Стоимость обучения',
            style: context.sp(StyleRes.head36Title),
          ),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          MessageCard(
            child: Column(
              children: [
                Text(
                  '55 900₽',
                  style: context.sp(StyleRes.head56Title),
                ),
                Text(
                  '65 000₽',
                  style: context.sp(
                    StyleRes.head40Title.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: ColorRes.textYellow.withAlpha(160),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          Align(alignment: Alignment.topCenter, child: SubmitForm()),
        ],
      ),
    );
  }

  Widget _buildTargets(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Обучение длится 4 месяца',
            style: context.sp(StyleRes.head36Title),
          ),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40.0,
            runSpacing: 40.0,
            children: [
              _buildTargetCard(
                context,
                '10',
                'мастер-классов\n',
                'задать вопросы, поработать над нешаблонными заданиями',
              ),
              _buildTargetCard(
                context,
                '48',
                'видеоуроков\n',
                'познакомиться с теорией',
              ),
              _buildTargetCard(
                context,
                '57',
                'домашних заданий\n',
                'применить знания на практике',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTargetCard(BuildContext context, String icon, String title, String desc) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.sw600 ? 300.0 : 520.0),
      child: CornerCard(
        cornerSize: context.sw600 ? 72.0 : 120.0,
        icon: Text(icon, style: context.sp(StyleRes.head56Title)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: context.sw600 ? 56.0 : 112.0),
              child: Text(title, style: context.sp(StyleRes.head36Title)),
            ),
            Divider(
              color: ColorRes.textRed,
              thickness: 1.0,
              indent: context.sw600 ? 56.0 : 112.0,
            ),
            Text(
              desc,
              style: context.sp(StyleRes.content24Blue),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMentors(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ваши преподаватели — лучшие разработчики Flutter в России',
            style: context.sp(StyleRes.head36Title),
          ),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40.0,
            runSpacing: 40.0,
            children: [
              _buildPersonCard(
                context,
                'Евгений Сатуров',
                ImageRes.mentor_0,
                'ТЕХНИЧЕСКИЙ ЕВАНГЕЛИСТ В SURF, FLUTTER/ANDROID РАЗРАБОТЧИК, ТИМЛИД',
                'Основатель Flutter Dev Podcast. Соорганизатор крупнейшей российской мобильной конференции Mobius. Лидер регионального IT-коммьюнити Google Developer Group Voronezh. За плечами 14 проектов в Surf. Среди них Росбанк Бизнес (Flutter), SBI bank (Android), MDK (Android).',
              ),
              _buildPersonCard(
                context,
                'Артем Зайцев',
                ImageRes.mentor_2,
                'РУКОВОДИТЕЛЬ FLUTTER-ОТДЕЛА В SURF',
                'В прошлом Android-разработчик. Полтора года назад увидел Flutter и понял, что за ним будущее.Стоял у истоков Flutter-отдела в Surf. Теперь руководит этим отделом и активно продвигает Flutter в российском комьюнити. Со-ведущий Flutter Dev Podcast.',
              ),
              _buildPersonCard(
                context,
                'Михаил Зотьев',
                ImageRes.mentor_1,
                'ВЕДУЩИЙ FLUTTER-РАЗРАБОТЧИК В SURF',
                'До мобильной разработки работал 5 лет в геймдеве. За это время успел попробовать множество технологий — и клиентских, и серверных. Увлекся кроссплатформенной мобильной разработкой и понял, что это именно то, что искал всё время. Сейчас активно работает над проектом КFC. Периодически пишет статьи по разработке на Flutter, делится опытом и знаниями с комьюнити.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPersonCard(
    BuildContext context,
    String name,
    String image,
    String position,
    String desc,
  ) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.sw600 ? 400.0 : 600.0),
      child: PersonCard(
        imageSize: context.sw600 ? 140.0 : 240.0,
        name: name.toUpperCase(),
        image: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        child: Column(
          children: [
            Text(
              position.toUpperCase(),
              style: context.sp(StyleRes.content24Blue),
            ),
            Divider(
              color: ColorRes.textBlue,
              thickness: 1.0,
            ),
            Text(
              desc,
              style: context.sp(StyleRes.content20Blue),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSert(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('А еще вы получите', style: context.sp(StyleRes.head36Title)),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          Container(
            constraints: BoxConstraints(maxWidth: context.sw600 ? 400.0 : 800.0),
            child: CornerCard(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
              child: context.sw600
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.0),
                        Text(
                          '📜 Электронный сертификат об окончании курса — для вашего резюме.',
                          style: context.sp(StyleRes.content20Blue),
                        ),
                        SizedBox(height: 16.0, width: 16.0),
                        Text(
                          '🔑 Безлимитный доступ ко всем материалам курса и актуальными обновлениям по нему.',
                          style: context.sp(StyleRes.content20Blue),
                        ),
                        SizedBox(height: 24.0),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              ClipPath(
                                clipper: MessageClipper(),
                                child: adaptiveIcon(
                                  IconRes.sert,
                                  width: context.sw600 ? 240.0 : 300.0,
                                ),
                              ),
                              Positioned.fill(
                                child: CustomPaint(
                                  painter: MessagePainter(),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),
                      ],
                    )
                  : Flex(
                      direction: Axis.horizontal,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 64.0),
                              Text(
                                '📜 Электронный сертификат об окончании курса — для вашего резюме.',
                                style: context.sp(StyleRes.content20Blue),
                              ),
                              SizedBox(height: 16.0, width: 16.0),
                              Text(
                                '🔑 Безлимитный доступ ко всем материалам курса и актуальными обновлениям по нему.',
                                style: context.sp(StyleRes.content20Blue),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 24.0),
                        Flexible(
                          flex: 2,
                          child: Stack(
                            children: [
                              ClipPath(
                                clipper: MessageClipper(),
                                child: adaptiveIcon(
                                  IconRes.sert,
                                  width: context.sw600 ? 240.0 : 300.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned.fill(
                                child: CustomPaint(
                                  painter: MessagePainter(),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnrollBtn2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
          child: Text('Учеба дистанционная, но преподаватели рядом', style: context.sp(StyleRes.head36Title)),
        ),
        SizedBox(height: context.sw600 ? 16.0 : 48.0),
        _buildEnrollBtn(context),
      ],
    );
  }

  Widget _buildAfterCourse(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Помощь с трудоустройством после окончания курса', style: context.sp(StyleRes.head36Title)),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40.0,
            runSpacing: 40.0,
            children: [
              _buildSkillCard(
                context,
                IconRes.briefcase,
                'Карьерные консультации\n',
                desc:
                    'Поможем грамотно составить резюме, дадим рекомендации по поиску работы и организуем консультацию от HR.',
              ),
              _buildSkillCard(
                context,
                IconRes.resume,
                'Оплачиваемая стажировка в Surf',
                desc:
                    'для лучших студентов курса. Мы не гарантируем трудоустройство, но при еë успешном прохождении у вас появится возможность стать частью Surf Flutter team.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLectures(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Как проходит обучение', style: context.sp(StyleRes.head36Title)),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          Align(
            alignment: Alignment.centerRight,
            child: MessageCard(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: context.sw600 ? 220.0 : 300.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('4', style: context.sp(StyleRes.content56Blue)),
                        SizedBox(width: 16.0),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('часа', textAlign: TextAlign.left, style: context.sp(StyleRes.content20Blue)),
                            Text('в неделю', textAlign: TextAlign.left, style: context.sp(StyleRes.content20Blue))
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (!context.sw600) SizedBox(width: 20.0)
                ],
              ),
            ),
          ),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          _buildImageCard(
            context,
            'Лекции с видеоуроками',
            'Преподаватель объясняет теорию и демонстрирует её на примерах в формате лайв-кодинга.',
            ImageRes.lecture_0,
          ),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          _buildImageCard(
            context,
            'Домашние задания с проверкой',
            'Наставники делают код-ревью, дают быструю и подробную обратную связь.',
            ImageRes.lecture_1,
          ),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          _buildImageCard(
            context,
            'Практические мастер-классы',
            'Преподаватели дают информацию сверх программы, отвечают на вопросы и разбирают ваши кейсы в режиме онлайн.',
            ImageRes.lecture_2,
          ),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          _buildImageCard(
            context,
            'Чат с преподавателями и другими студентами',
            'Отвечаем на вопросы, делимся знаниями, кейсами, статьями и вакансиями.',
            ImageRes.lecture_3,
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(
    BuildContext context,
    String title,
    String desc,
    String src,
  ) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.sw600 ? 400.0 : 800.0),
      child: CornerCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 64.0,
              ),
              child: Text(title, style: context.sp(StyleRes.head24Title)),
            ),
            Divider(
              color: ColorRes.btnBackRed,
              indent: 64.0,
              thickness: 2.0,
            ),
            SizedBox(height: 16.0),
            Image.asset(
              src,
              fit: BoxFit.contain,
              // width: context.sw600 ? 280.0 : 600.0,
            ),
            SizedBox(height: 16.0),
            Text(
              desc,
              style: context.sp(StyleRes.content20Blue),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoQuality(BuildContext context) {
    if (!kIsWeb && !Platform.isIOS && !Platform.isAndroid) return Container();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
          child: Text('Студийное качество лекций', style: context.sp(StyleRes.head36Title)),
        ),
        SizedBox(height: context.sw600 ? 16.0 : 48.0),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: MessageCard(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: context.sw600 ? 220.0 : 300.0,
                    child: Text(
                      '''В каждой лекции качественный видеоряд и хороший звук. Мы сделали тизер курса с нарезкой из уроков, чтобы показать и рассказать, что вас ожидает.''',
                      textAlign: TextAlign.right,
                      style: context.sp(StyleRes.content16Blue),
                    ),
                  ),
                  if (!context.sw600) SizedBox(width: 20.0)
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: context.sw600 ? 16.0 : 48.0),
        Align(
          alignment: Alignment.center,
          child: LayoutBuilder(builder: (context, constraints) {
            const maxHeight = 500.0;
            final maxWidth = maxHeight * (16.0 / 9.0);
            double width;
            double height;
            if (constraints.maxWidth - 48.0 < maxWidth) {
              width = constraints.maxWidth - 48.0;
              height = width * (9.0 / 16.0);
            } else {
              height = maxHeight;
              width = maxWidth;
            }

            return SizedBox(
              height: height,
              width: width,
              child: YoutubeWidget(
                height: height,
                width: width,
                url: 'https://www.youtube.com/embed/Yw4srSTb5SA',
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildProps(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Surf — эксперт во Flutter', style: context.sp(StyleRes.head36Title)),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40.0,
            runSpacing: 40.0,
            children: [
              _buildSkillCard(context, IconRes.aware, '\n',
                  desc: 'Surf одним из первых в России начал использовать в разработке технологию Flutter.'),
              _buildSkillCard(context, IconRes.power, '\n',
                  desc:
                      'Реализовали на Flutter большие e-commerce и банковские проекты: среди них приложения для Росбанка, сети аптек «Ригла», ресторанов KFC.'),
              _buildSkillCard(context, IconRes.activity, '\n', desc: '''У Surf наработана большая база знаний:
• пишем статьи о технических тонкостях,
• обучаем студентов-стажёров для найма в компанию,
• делимся библиотеками и наработками по Flutter в публичном репозитории на Github.'''),
            ],
          ),
          SizedBox(height: context.sw600 ? 16.0 : 32.0),
          Align(
              alignment: Alignment.bottomRight,
              child: MessageCard(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: context.sw600 ? 220.0 : 300.0,
                      child: Text(
                        'Мы расскажем всё, что знаем о Flutter сами. Без утайки!',
                        textAlign: TextAlign.right,
                        style: context.sp(StyleRes.content16Blue),
                      ),
                    ),
                    if (!context.sw600) SizedBox(width: 20.0)
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildSkills(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Опытные Flutter-разработчики научат', style: context.sp(StyleRes.head36Title)),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40.0,
            runSpacing: 40.0,
            children: [
              _buildSkillCard(context, IconRes.arch, '1. Проектировать архитектуру\n',
                  desc: 'кроссплатформенных приложений'),
              _buildSkillCard(context, IconRes.dev, '2. Разрабатывать приложения\n', desc: 'на Dart и Flutter'),
              _buildSkillCard(context, IconRes.anim, '3. Делать красивые анимации\n', desc: 'интерфейса'),
              _buildSkillCard(context, IconRes.net, '4. Работать с сетью\n', desc: 'и хранением данных'),
              _buildSkillCard(context, IconRes.inter, '5. Строить взаимодействие\n',
                  desc: 'с платформой внутри фреймворка'),
              _buildSkillCard(context, IconRes.release, '6. Готовить к релизу\n',
                  desc: 'полноценное кроссплатформенное приложение'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context, String icon, String title, {String desc}) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.sw600 ? 400.0 : 600.0),
      child: CornerCard(
        cornerSize: context.sw600 ? 64.0 : 96.0,
        icon: adaptiveIcon(
          icon,
          width: context.sw600 ? 48.0 : 72.0,
          height: context.sw600 ? 48.0 : 72.0,
          fit: BoxFit.fill,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: context.sw600 ? 64.0 : 96.0,
              ),
              child: Text(title, style: context.sp(StyleRes.head24Title)),
            ),
            if (desc != null)
              Divider(
                color: ColorRes.btnBackRed,
                indent: 64.0,
                thickness: 2.0,
              ),
            if (desc != null) SizedBox(height: 16.0),
            if (desc != null) Text(desc, style: context.sp(StyleRes.content20Blue)),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefits(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Преимущества курса', style: context.sp(StyleRes.head36Title)),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40.0,
            runSpacing: 40.0,
            children: [
              _buildBenefitCard(
                context,
                'Преподаватели-практики',
                'Курс ведут разработчики Surf, которые каждый день решают реальные задачи на Flutter.',
                Icons.build_circle_sharp,
              ),
              _buildBenefitCard(
                context,
                'Погружение в реальную разработку',
                'Предоставляем дизайн в Figma для задач по вëрстке и сервер для реализации клиент-серверного взаимодействия.',
                Icons.insights_outlined,
              ),
              _buildBenefitCard(
                context,
                'Много обратной связи',
                'Отвечаем на все вопросы в чате и поддерживаем каждого студента.',
                Icons.reply_all_rounded,
              ),
            ],
          ),
          SizedBox(height: context.sw600 ? 16.0 : 48.0),
        ],
      ),
    );
  }

  Widget _buildBenefitCard(
    BuildContext context,
    String title,
    String desc,
    IconData icon,
  ) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.sw600 ? 400.0 : 600.0),
      child: CornerCard(
        icon: Icon(
          icon,
          color: ColorRes.textRed,
          size: 48.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 64.0),
              child: Text(title, style: context.sp(StyleRes.head24Title)),
            ),
            Divider(
              color: ColorRes.btnBackRed,
              indent: 64.0,
              thickness: 2.0,
            ),
            SizedBox(height: 16.0),
            Text(desc, style: context.sp(StyleRes.content20Blue)),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildEnrollBtn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sw600 ? 32.0 : 96.0, right: 24.0),
      child: PrimaryBtn.legendary(
        onPressed: () {},
        height: context.sw600 ? 72.0 : 108.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ЗАПИСАТЬСЯ НА КУРС', style: context.sp(StyleRes.head24Title)),
            SizedBox(height: context.sw600 ? 2.0 : 8.0),
            Text('Старт занятий 5 марта 2021', style: context.sp(StyleRes.content20Blue)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: context.sw600 ? 32.0 : 96.0),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.sw600 ? 100.0 : 156.0),
            Text('ПРАКТИЧЕСКИЙ ОНЛАЙН-КУРС', style: context.sp(StyleRes.head24Title)),
            SizedBox(height: context.sw600 ? 8.0 : 16.0),
            Text(
              'FLUTTER-РАЗРАБОТЧИК',
              style: context.sp(StyleRes.head56Title),
              semanticsLabel: 'HeaderSemantic',
            ),
            SizedBox(height: context.sw600 ? 8.0 : 16.0),
            Text(
                'Вы изучите язык Dart и фреймворк Flutter.\nНаучитесь создавать современные мобильные\nприложения сразу под две платформы: iOS и Android.',
                style: context.sp(StyleRes.content20Blue)),
          ],
        )),
        if (context.sw600) SizedBox(width: 24.0),
        if (!context.sw600)
          adaptiveIcon(
            IconRes.mainHead,
            width: min(context.scWidth * .25, 400.0),
            height: min(context.scWidth * .25, 400.0),
            fit: BoxFit.cover,
          ),
      ],
    );
  }
}

class MainScrollProvider extends InheritedWidget {
  final ScrollController scrollController;

  MainScrollProvider({Key key, this.child})
      : scrollController = ScrollController(),
        super(key: key, child: child);

  final Widget child;

  static MainScrollProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainScrollProvider>();
  }

  @override
  bool updateShouldNotify(MainScrollProvider oldWidget) {
    return true;
  }
}
