//DMS Permission type
import 'package:flutter/material.dart';

import '../../routes/route_constants.dart';
import '../models/drawer_model.dart';

List<String?> dmsPermissionType = [
  'Allow',
  'Deny',
];

//DMS Access type
List<String?> dmsAccessType = [
  'Read Only',
  'Modify',
  'Full Access',
];

//DMS AppliesTo type
List<String?> dmsAppliesToType = [
  'Only This Folder',
  'This Folder And Files',
  'This Folder, Subfolders And Files',
  'Only This Document',
  'All Documents in this Folder and Sub Folders',
];
