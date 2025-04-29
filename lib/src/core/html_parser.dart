import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:html/parser.dart' as html;

List<ClassBlock> parseCoursesToJson(String htmlContent) {
    var document = html.parse(htmlContent);
    var classSelector = '.class-content';
    List<ClassBlock> result = [];

    var classBlocks = document.querySelectorAll(classSelector);

    for (var classBlock in classBlocks) {
        var className = classBlock.querySelector('.class-name')?.text ?? '';
        var classDate = classBlock
            .querySelector('.class-date')?.text
            .replaceAll('\n', '')
            .trim() ?? '';

        List<CoursesItem> courseList = [];
        var courseItems = classBlock.querySelectorAll('.my_course_item');

        for (var item in courseItems) {
            var courseName = item.querySelector('.my_course_name')?.attributes['title']?.trim() ?? '';
            var status = item.querySelector('.my_course_status')?.text.trim() ?? '';
            var imageUrl = item.querySelector('.my_course_cover')?.attributes['src'] ?? '';
            var courseUrl = item.querySelector('.hideurl')?.text.trim() ?? '';
            var tutorialId = item.attributes['tutorialid'] ?? '';

            courseList.add(CoursesItem(
                courseName: courseName,
                status: status,
                image: imageUrl,
                courseUrl: courseUrl,
                tutorialId: tutorialId,
            ));
        }

        // Use regex to extract the dates
        var re = RegExp(r'(\d{1,4}\.\d{1,2}\.\d{1,2})\s.+?\s+(\d{1,4}\.\d{1,2}\.\d{1,2})');
        var matches = re.firstMatch(classDate);
        String startDate = matches?.group(1)?.replaceAll('.', '-') ?? '';
        String endDate = matches?.group(2)?.replaceAll('.', '-') ?? '';

        result.add(ClassBlock(
            className: className,
            dateRange: classDate,
            startDate: startDate,
            endDate: endDate,
            courses: courseList,
        ));
    }

    return result;
}
