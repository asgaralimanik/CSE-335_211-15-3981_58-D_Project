import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String projectLink;
  final String projectImage;

  const ProjectCard({
    required this.title,
    required this.description,
    required this.projectLink,
    required this.projectImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              projectImage,
              height: 100, // Adjust the height as needed
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(description),
            SizedBox(height: 8.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _launchURL(projectLink);
                  },
                  child: Text(
                    'Open Project',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 0, 0),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Project Link: $projectLink',
                    style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 151, 144),
      appBar: AppBar(
        title:
            const Text('My Portfolio', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 18, 6, 126),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundImage: NetworkImage(
                  "https://scontent.fdac22-1.fna.fbcdn.net/v/t39.30808-6/358422452_727965412672300_1216749857356859823_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF-c3alDbQAHKnHC5d3BJZnF2gCSSAt8oYXaAJJIC3yhvoq9-rkd_dcE5pDhR4kdH24o756Xh8htW3yaquo1U_X&_nc_ohc=KZ_PAxkhyhMAX9XLP7e&_nc_ht=scontent.fdac22-1.fna&oh=00_AfB2IR9V7zPPVyboOLwLDTROoIluDbLEYp3riXgID4mbqw&oe=655BE3DA"),
            ),
            SizedBox(height: 16.0),
            Text(
              'Md. Asgar Ali Manik',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'UI/UX Designer',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24.0),
            Card(
              color: Color.fromARGB(255, 255, 208, 0),
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.man),
                title: Text(
                    'Hi, This is Asgar Ali Manik. I have had a different love for design since childhood. And from that love, I became interested in graphic design. Currently, I am studying Computer Science and Engineering as well as gaining experience in the details of graphic Design. I have experience in Adobe Photoshop, Adobe Illustrator, Adobe XD, and Figma. Since 2018, I have been working on Banner Design, Flyer Design, Logo Design, Box Packaging, Facebook ads, Website Design, Mobile App Design, etc. And with you, I want to work through fiber. It is my commitment to work successfully with your needs in mind.'),
              ),
            ),
            SizedBox(height: 24.0),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('YKSG01, Birulia, Savar, Dhaka-1216'),
              ),
            ),
            SizedBox(height: 24.0),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('manik15-3981@diu.edu.bd'),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('+880 1776-661172'),
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Skills',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 20,
              runSpacing: 8.0,
              children: [
                Chip(
                  label: Text('Flutter', style: TextStyle(color: Colors.black)),
                ),
                Chip(
                  label: Text('UI/UX', style: TextStyle(color: Colors.black)),
                ),
                Chip(
                  label: Text('Adobe Photoshop',
                      style: TextStyle(color: Colors.black)),
                ),
                Chip(
                  label: Text('Adobe Illustrator',
                      style: TextStyle(color: Colors.black)),
                ),
                Chip(
                  label: Text('Figma', style: TextStyle(color: Colors.black)),
                ),
                Chip(
                  label: Text('Banner Design',
                      style: TextStyle(color: Colors.black)),
                ),
                Chip(
                  label: Text('Facebook Ads',
                      style: TextStyle(color: Colors.black)),
                ),
                Chip(
                  label: Text('Poster Design',
                      style: TextStyle(color: Colors.black)),
                ),
                // Add more skills as needed
              ],
            ),
            SizedBox(height: 24.0),
            Text(
              'Projects',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Image.network(
              'https://cdn.dribbble.com/userupload/10013745/file/original-afd3d95a8ac35dcd9dffd5b71608443a.jpg?resize=400x0', // Replace with your image URL
              height: 325.0, // Adjust the height as needed
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(height: 8.0),
            ProjectCard(
              title: 'DIU Transport System',
              description:
                  'It is a UI/UX design. User-friendly how the Daffodil International University Transport System app will work through UI/UX design.',
              projectLink:
                  'https://xd.adobe.com/view/b39d3469-43ac-449c-afce-90b34df0546b-e6ce/',
              projectImage:
                  'https://cdn.dribbble.com/userupload/5016450/file/original-872356247a6fb188e3e17c777273d4a5.png?resize=400x0',
            ),
            ProjectCard(
              title: 'Tree Info',
              description:
                  'Tree Info can currently recognize 90% of all known species of plants and trees, covering most of the species you will encounter in every country on Earth. - Quickly identify plants, flowers, trees, and more. - Instant access to a huge Plant Database that constantly learns and adds information on new plant species.',
              projectLink:
                  'https://xd.adobe.com/view/020e31ce-7ad6-46c1-b630-0fedaf191abb-575d/',
              projectImage:
                  'https://res.cloudinary.com/soar-communications-group-ltd/images/f_auto,q_auto/v1653656969/goodmagazine.co.nz/Track-Your-Tree_TreeTimeApp/Track-Your-Tree_TreeTimeApp.png?_i=AA',
            ),
            // Add more ProjectCard instances as needed
          ],
        ),
      ),
    );
  }
}
