import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firstappofmine/water_track.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassNoTEController =
  TextEditingController(text: '1');
  List<WaterTrack> waterTrackList = [];
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _glassNoTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          'Water Tracker',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.3),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildWaterTrackCounter(),
            const SizedBox(height: 24),
            Expanded(
              child: _buildWaterTrackListView(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddWaterTrack,
        backgroundColor: Colors.teal[400],
        child: const Text(
          '+',
          style: TextStyle(
            fontSize: 33,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildRealTimeClock() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            "${_currentTime.day}/${_currentTime.month}/${_currentTime.year}",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterTrackListView() {
    return waterTrackList.isEmpty
        ? Center(
      child: Text(
        'Start tracking your water intake!',
        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
      ),
    )
        : ListView.separated(
      itemCount: waterTrackList.length,
      itemBuilder: (context, index) {
        return _buildWaterTrackListTile(index);
      },
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey[300]);
      },
    );
  }

  Widget _buildWaterTrackListTile(int index) {
    WaterTrack waterTrack = waterTrackList[index];

    return Dismissible(
      key: Key(waterTrack.dateTime.toString()),
      onDismissed: (direction) => _onTapDeleteButton(index),
      background: Container(
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete_forever, color: Colors.white),
      ),
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          title: Text(
            '${waterTrack.dateTime.hour.toString().padLeft(2, '0')}:${waterTrack.dateTime.minute.toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            '${waterTrack.dateTime.day}/${waterTrack.dateTime.month}/${waterTrack.dateTime.year}',
            style: const TextStyle(color: Colors.grey),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.teal[400],
            child: Text(
              '${waterTrack.noOfGlasses}',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          trailing: TextButton(
            onPressed: () => _onTapDeleteButton(index),
            child: const Text(
              'Clear',
              style: TextStyle(
                color: Colors.redAccent, // Customize the text color as needed
                fontSize: 16, // Customize the font size as needed
              ),
            ),
            style: TextButton.styleFrom(
              minimumSize: Size.zero, // Set to zero to remove any default minimum size
              padding: EdgeInsets.zero, // Set to zero to remove any default padding
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWaterTrackCounter() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              getTotalGlassCount().toString(),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const Text(
              'Glass(es) of Water',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: _glassNoTEController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, color: Colors.black87),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _onTapAddWaterTrack,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[400],
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildTimerDisplay(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerDisplay() {
    final hours = _currentTime.hour.toString().padLeft(2, '0');
    final minutes = _currentTime.minute.toString().padLeft(2, '0');
    final seconds = _currentTime.second.toString().padLeft(2, '0');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '$hours:$minutes:$seconds',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Current Time',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  int getTotalGlassCount() {
    int counter = 0;
    for (WaterTrack t in waterTrackList) {
      counter += t.noOfGlasses;
    }
    return counter;
  }

  void _onTapAddWaterTrack() {
    if (_glassNoTEController.text.isEmpty) {
      _glassNoTEController.text = '1';
    }
    final int noOfGlasses = int.tryParse(_glassNoTEController.text) ?? 1;
    WaterTrack waterTrack = WaterTrack(
      noOfGlasses: noOfGlasses,
      dateTime: DateTime.now(),
    );
    setState(() {
      waterTrackList.add(waterTrack);
    });
  }

  void _onTapDeleteButton(int index) {
    setState(() {
      waterTrackList.removeAt(index);
    });
  }
}
